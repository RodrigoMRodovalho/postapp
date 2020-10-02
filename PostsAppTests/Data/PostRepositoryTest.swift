//
//  PostRepositoryTest.swift
//  PostsAppTests
//
//  Created by Rodrigo Rodovalho on 02/10/20.
//

import XCTest
import Cuckoo
import RxBlocking
import RxSwift
@testable import PostsApp

class PostRepositoryTest: XCTestCase {

    var sut: PostRepository!
    var remoteServiceProtocol: MockRemoteServiceProtocol!
    let dataMapper = DataMapper()
    let testUtl = TestUtil()
    
    override func setUpWithError() throws {
        super.setUp()
        remoteServiceProtocol = MockRemoteServiceProtocol()
        sut = PostRepository(remoteService: remoteServiceProtocol, dataMapper: dataMapper)
    }

    override func tearDownWithError() throws {
        sut = nil
        remoteServiceProtocol = nil
    }

    
    func testPostRepositoryTest_WhenFetchingDataWithSuccess_ShouldReturnDataMapped() throws {
        
        let postResponseModel = testUtl.createPostResponseModel(withQuantityOfData: 2)
        
        stub(remoteServiceProtocol) {  remoteServiceProtocol in
            when(remoteServiceProtocol.request(path: equal(to: ApiPath.post), method: equal(to: HTTPMethod.get), parameters: ["limit": "10" , "page" : "20"]))
                .thenReturn(Single.just(postResponseModel))
        }
        
        let post1 = testUtl.createPost(1)
        let post2 = testUtl.createPost(2)
        
        let postData = try sut.fetchPostData(limit: 10, page: 20).toBlocking().last()
        XCTAssertTrue(postData?.count == 2)
        XCTAssertEqual(post1, postData![0])
        XCTAssertEqual(post2, postData![1])
    }

}
