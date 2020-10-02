//
//  PostListViewModelTest.swift
//  PostsAppTests
//
//  Created by Rodrigo Rodovalho on 01/10/20.
//

import XCTest
import Cuckoo
import RxSwift
import RxBlocking

@testable import PostsApp

class PostListViewModelTest: XCTestCase {

    var sut : PostListViewModel!
    var mockUseCase: MockGetPostUseCase!
    
    override func setUpWithError() throws {
        let repo = MockPostRepositoryProtocol()
        mockUseCase = MockGetPostUseCase(repository: repo)
        sut = PostListViewModel(getPostUseCase: mockUseCase)
    }

    override func tearDownWithError() throws {
        sut = nil
        mockUseCase = nil
    }

    func testPostListViewModel_WhenFetchingDataWithSuccess_ShouldPublishSuccessInObserver() throws {
        
        let expectation = self.expectation(description: "PostListViewModel")
        
        let post = createPost(1)
        let post2 = createPost(2)
        
        stub(mockUseCase) {  useCase in
            when(useCase.executeUseCase(requestValues: any())).thenReturn(Maybe.just([post, post2]))
        }
        
        _ = sut.observePostData.subscribe(onNext: { (result) in
            switch result {
                case.success(let postArray):
                    XCTAssertEqual(post, postArray[0])
                    XCTAssertEqual(post2, postArray[1])
                    XCTAssertEqual(2, postArray.count)
                case .failure(_):
                    XCTFail()
            }
            expectation.fulfill()
        })
        
        sut.fetchPosts()
        
        waitForExpectations(timeout: 2, handler: nil)
    }
    
    func testPostListViewModel_WhenFetchingDataWithError_ShouldPublishFailureInObserver() throws {
        
        let expectation = self.expectation(description: "PostListViewModel")
        
        stub(mockUseCase) {  useCase in
            when(useCase.executeUseCase(requestValues: any())).thenReturn(Maybe.error(RemoteServiceError.malformedURL))
        }
        
        _ = sut.observePostData.subscribe(onNext: { (result) in
            switch result {
                case.success(_):
                    XCTFail()
                case .failure(let error):
                    XCTAssertEqual(RemoteServiceError.malformedURL, error as! RemoteServiceError)
            }
            expectation.fulfill()
        })
        
        sut.fetchPosts()
        
        waitForExpectations(timeout: 2, handler: nil)
    }
    
    
    
    private func createPost(_ identifier: Int) -> Post {
        return Post(id: "id\(identifier)", authorFirstName: "first\(identifier)", authorLastName: "last\(identifier)", authorEmail: "email\(identifier)", authorProfilePictureUrl: "profile\(identifier)", title: "title\(identifier)", originalUrl: "original\(identifier)", likes: identifier, createdDatetime: "time\(identifier)", tagList: ["tag\(identifier)"], imageUrl: "image\(identifier)")
    }
}
