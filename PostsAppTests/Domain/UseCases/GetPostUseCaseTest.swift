//
//  GetPostUseCaseTest.swift
//  PostsAppTests
//
//  Created by Rodrigo Rodovalho on 01/10/20.
//


import XCTest
import Cuckoo
import RxSwift
import RxBlocking

@testable import PostsApp

class GetPostsUseCaseTest: XCTestCase {

    var sut : GetPostUseCase!
    var repositoryProtocol: MockPostRepositoryProtocol!
    let testUtl = TestUtil()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        repositoryProtocol = MockPostRepositoryProtocol()
        sut = GetPostUseCase(repository: repositoryProtocol)
    }

    override func tearDownWithError() throws {
        sut = nil
        repositoryProtocol = nil
    }

    func testGetPostsUseCase_WhenNoPostFetched_ShouldReturnEmptyData() throws {
        
        stub(repositoryProtocol) {  repositoryProtocol in
            when(repositoryProtocol.fetchPostData(limit: 10, page: 0)).thenReturn(Single.just([Post]()))
        }
        
        let postData = try sut?.run().toBlocking().last()
        
        XCTAssertEqual(0, postData?.count)
    }
    
    func testGetPostUseCase_WhenValidPostsFetched_ShouldReturnAllData() throws {
        
        let post1 = testUtl.createPost(1)
        let post2 = testUtl.createPost(2)
        let post3 = testUtl.createPost(3)
        
        let fetchedData = [post1, post2, post3]
        
        stub(repositoryProtocol) {  repositoryProtocol in
            when(repositoryProtocol.fetchPostData(limit: 10, page: 0)).thenReturn(Single.just(fetchedData))
        }
        
        let postData = try sut?.run().toBlocking().last()
        
        XCTAssertEqual(3, postData?.count)
        XCTAssertEqual(post1, postData![0])
        XCTAssertEqual(post2, postData![1])
        XCTAssertEqual(post3, postData![2])
    }
    
    func testGetPostUseCase_WhenFetchingNextPage_ShouldReturnData() throws {
        
        let post1 = testUtl.createPost(1)
        let post2 = testUtl.createPost(2)
        
        stub(repositoryProtocol) {  repositoryProtocol in
            when(repositoryProtocol.fetchPostData(limit: 10, page: 0)).thenReturn(Single.just([post1]))
            when(repositoryProtocol.fetchPostData(limit: 10, page: 1)).thenReturn(Single.just([post2]))
        }
        
        let postDataFirstRun = try sut?.run().toBlocking().last()
        
        XCTAssertEqual(1, postDataFirstRun?.count)
        XCTAssertEqual(post1, postDataFirstRun![0])
        
        let postDataSecondRun = try sut?.run().toBlocking().last()
        
        XCTAssertEqual(1, postDataFirstRun?.count)
        XCTAssertEqual(post2, postDataSecondRun![0])
    }
    
    func testGetPostUseCase_WhenPerformingExecutionFetch_ShouldExecutedCommand() throws {
            
        let expectation = self.expectation(description: "GetPostUseCase")
        
        stub(repositoryProtocol) {  repositoryProtocol in
            when(repositoryProtocol.fetchPostData(limit: 10, page: 0)).thenReturn(Single.just([testUtl.createPost(1)])
                                                                                    .delay(RxTimeInterval.seconds(2), scheduler: ConcurrentDispatchQueueScheduler(qos: .background) ))
            when(repositoryProtocol.fetchPostData(limit: 10, page: 1)).thenReturn(Single.just([testUtl.createPost(2)]))
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
        verify(repositoryProtocol, times(1)).fetchPostData(limit: 10, page: 0)
        
        _ = sut?.run().subscribe(onSuccess: { (post) in
            verify(self.repositoryProtocol, times(1)).fetchPostData(limit: 10, page: 1)
        }, onError: nil, onCompleted: nil)
        
        waitForExpectations(timeout: 3)
        
        XCTAssertFalse(sut.isExecuting)
        XCTAssertEqual(1, sut.currentPage)
    }
    
    func testGetPostUseCase_WhenErrorHappened_ShouldReturnStreamError() throws {
        
        stub(repositoryProtocol) {  repositoryProtocol in
            when(repositoryProtocol.fetchPostData(limit: 10, page: 0))
                .thenReturn(Single.error(RemoteServiceError.notConnectedToInternet))
        }
        
        XCTAssertThrowsError(try sut?.run().toBlocking().last()) { error in
            XCTAssertEqual(error as? RemoteServiceError, RemoteServiceError.notConnectedToInternet)
        }
    }

}
