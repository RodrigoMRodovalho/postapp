//
//  GetPostCommentsUseCase.swift
//  PostsAppTests
//
//  Created by Rodrigo Rodovalho on 04/10/20.
//

import XCTest
import Cuckoo
import RxSwift
import RxBlocking

@testable import PostsApp

class GetPostCommentsUseCaseTest: XCTestCase {

    var sut : GetPostCommentsUseCase!
    var repositoryProtocol: MockPostRepositoryProtocol!
    let testUtl = TestUtil()
    let postId = "1"
    
    override func setUpWithError() throws {
        repositoryProtocol = MockPostRepositoryProtocol()
        sut = GetPostCommentsUseCase(repository: repositoryProtocol)
        sut.requestValues = GetPostCommentsRequestValues(postId: self.postId)
    }

    override func tearDownWithError() throws {
        sut = nil
        repositoryProtocol = nil
    }

    func testGetPostCommentsUseCase_WhenNoPostFetched_ShouldReturnEmptyData() throws {
        
        stub(repositoryProtocol) {  repositoryProtocol in
            when(repositoryProtocol.fetchPostComments(withId: postId, limit: 10, page: 0)).thenReturn(Single.just([Comment]()))
        }
        
        let postData = try sut?.run().toBlocking().last()
        
        XCTAssertEqual(0, postData?.count)
    }
    
    func testGetPostCommentsUseCase_WhenValidPostsFetched_ShouldReturnAllData() throws {
        
        let comment1 = testUtl.createComment(1)
        let comment2 = testUtl.createComment(2)
        let comment3 = testUtl.createComment(3)
        
        let fetchedData = [comment1, comment2, comment3]
        
        stub(repositoryProtocol) {  repositoryProtocol in
            when(repositoryProtocol.fetchPostComments(withId: postId, limit: 10, page: 0)).thenReturn(Single.just(fetchedData))
        }
        
        let commentData = try sut?.run().toBlocking().last()
        
        XCTAssertEqual(3, commentData?.count)
        XCTAssertEqual(comment1, commentData![0])
        XCTAssertEqual(comment2, commentData![1])
        XCTAssertEqual(comment3, commentData![2])
    }
    
    func testGetPostCommentsUseCase_WhenFetchingNextPage_ShouldReturnData() throws {
        
        let comment1 = testUtl.createComment(1)
        let comment2 = testUtl.createComment(2)
        
        stub(repositoryProtocol) {  repositoryProtocol in
            when(repositoryProtocol.fetchPostComments(withId: postId, limit: 10, page: 0)).thenReturn(Single.just([comment1]))
            when(repositoryProtocol.fetchPostComments(withId: postId, limit: 10, page: 1)).thenReturn(Single.just([comment2]))
        }
        
        let postDataFirstRun = try sut?.run().toBlocking().last()
        
        XCTAssertEqual(1, postDataFirstRun?.count)
        XCTAssertEqual(comment1, postDataFirstRun![0])
        
        let postDataSecondRun = try sut?.run().toBlocking().last()
        
        XCTAssertEqual(1, postDataFirstRun?.count)
        XCTAssertEqual(comment2, postDataSecondRun![0])
    }
    
    func testGetPostCommentsUseCase_WhenPerformingExecutionFetch_ShouldExecutedCommand() throws {
            
        let expectation = self.expectation(description: "GetPostCommentsUseCase")
        
        stub(repositoryProtocol) {  repositoryProtocol in
            
            when(repositoryProtocol.fetchPostComments(withId: postId, limit: 10, page: 0)).thenReturn(Single.just([testUtl.createComment(1)])
                                                                                                        .delay(RxTimeInterval.seconds(2), scheduler: ConcurrentDispatchQueueScheduler(qos: .background) ))
            when(repositoryProtocol.fetchPostComments(withId: postId, limit: 10, page: 1)).thenReturn(Single.just([testUtl.createComment(2)]))
        }
        
        XCTAssertEqual(0, sut.currentPage)
        
        _ = sut?.run().subscribe(onSuccess: { (posts) in
            XCTAssertEqual(1, posts.count)
            expectation.fulfill()
        })
        
        let postDataSecondRun = try sut?.run().toBlocking().last()
        XCTAssertTrue(sut.isExecuting)
        
        XCTAssertNil(postDataSecondRun)
        XCTAssertEqual(0, sut.currentPage)
        verify(repositoryProtocol, times(1)).fetchPostComments(withId: postId,limit: 10, page: 0)
        
        _ = sut?.run().subscribe(onSuccess: { (post) in
            verify(self.repositoryProtocol, times(1)).fetchPostComments(withId: self.postId, limit: 10, page: 1)
        }, onError: nil, onCompleted: nil)
        
        waitForExpectations(timeout: 3)
        
        XCTAssertFalse(sut.isExecuting)
        XCTAssertEqual(1, sut.currentPage)
    }
    
    func testGetPostCommentsUseCase_WhenErrorHappened_ShouldReturnStreamError() throws {
        
        stub(repositoryProtocol) {  repositoryProtocol in
            when(repositoryProtocol.fetchPostComments(withId: self.postId, limit: 10, page: 0))
                .thenReturn(Single.error(RemoteServiceError.notConnectedToInternet))
        }
        
        XCTAssertThrowsError(try sut?.run().toBlocking().last()) { error in
            XCTAssertEqual(error as? RemoteServiceError, RemoteServiceError.notConnectedToInternet)
        }
    }

}

