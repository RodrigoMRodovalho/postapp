//
//  PostListCommentsViewModel.swift
//  PostsAppTests
//
//  Created by Rodrigo Rodovalho on 04/10/20.
//

import XCTest
import Cuckoo
import RxSwift
import RxBlocking

@testable import PostsApp

class PostCommentsViewModelTest: XCTestCase {

    var sut: PostCommentsViewModel!
    var mockUseCase: MockGetPostCommentsUseCase!
    let testUtil = TestUtil()
    
    override func setUpWithError() throws {
        let repo = MockPostRepositoryProtocol()
        mockUseCase = MockGetPostCommentsUseCase(repository: repo)
        sut = PostCommentsViewModel(getPostCommentsUseCase: mockUseCase)
    }

    override func tearDownWithError() throws {
        sut = nil
        mockUseCase = nil
    }

    func testPostCommentsViewModel_WhenFetchingDataWithSuccess_ShouldPublishSuccessInObserver() throws {
        
        let expectation = self.expectation(description: "PostCommentsViewModel")
        
        let comment = testUtil.createComment(1)
        let comment2 = testUtil.createComment(2)
        
        let post = testUtil.createPost(1)
        
        stub(mockUseCase) {  useCase in
            when(useCase.executeUseCase(requestValues: GetPostCommentsRequestValues(postId: post.id)))
                .thenReturn(Maybe.just([comment, comment2]))
        }
        
        _ = sut.observePostCommentsData.subscribe(onNext: { (result) in
            switch result {
                case.success(let commentsArray):
                    XCTAssertEqual(comment, commentsArray[0])
                    XCTAssertEqual(comment2, commentsArray[1])
                    XCTAssertEqual(2, commentsArray.count)
                case .failure(_):
                    XCTFail()
            }
            expectation.fulfill()
        })
        
        sut.fetchComments(withPost: post)
        
        waitForExpectations(timeout: 2, handler: nil)
    }
    
    func testPostListViewModel_WhenFetchingDataWithError_ShouldPublishFailureInObserver() throws {

        let expectation = self.expectation(description: "PostCommentsViewModel")

        let post = testUtil.createPost(1)
        
        stub(mockUseCase) {  useCase in
            when(useCase.executeUseCase(requestValues: GetPostCommentsRequestValues(postId: post.id)))
                .thenReturn(Maybe.error(RemoteServiceError.malformedURL))
        }

        _ = sut.observePostCommentsData.subscribe(onNext: { (result) in
            switch result {
                case.success(_):
                    XCTFail()
                case .failure(let error):
                    XCTAssertEqual(RemoteServiceError.malformedURL, error as! RemoteServiceError)
            }
            expectation.fulfill()
        })

        sut.fetchComments(withPost: post)

        waitForExpectations(timeout: 2, handler: nil)
    }
}

extension GetPostCommentsRequestValues: OptionalMatchable {
    public var optionalMatcher: ParameterMatcher<GetPostCommentsRequestValues?> {
        return ParameterMatcher { $0?.postId == self.postId }
    }
}
