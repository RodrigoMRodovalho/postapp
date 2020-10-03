//
//  DataMapperTest.swift
//  PostsAppTests
//
//  Created by Rodrigo Rodovalho on 03/10/20.
//

import XCTest
@testable import PostsApp

class DataMapperTest: XCTestCase {
    
    var sut: DataMapper!
    let testUtil = TestUtil()

    override func setUpWithError() throws {
        sut = DataMapper()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testDataMapper_WhenTransformingPostResponseModel_ShouldReturnPost() throws {
        
        let postResponseModel = testUtil.createPostResponseModel(withQuantityOfData: 2)
        
        let post1 = testUtil.createPost(1)
        let post2 = testUtil.createPost(2)
        
        let postData = sut.transform(postResponseModel: postResponseModel)
        
        XCTAssertTrue(postData.count == 2)
        XCTAssertEqual(post1, postData[0])
        XCTAssertEqual(post2, postData[1])
    }
    
    func testDataMapper_WhenTransformingCommentResponseModel_ShouldReturnComment() throws {
        
        let commentResponseModel = testUtil.createCommentResponseModel(withQuantityOfData: 2)
        
        let comment1 = testUtil.createComment(1)
        let comment2 = testUtil.createComment(2)
        
        let commentData = sut.transform(commentResponseModel: commentResponseModel)
        
        XCTAssertTrue(commentData.count == 2)
        XCTAssertEqual(comment1, commentData[0])
        XCTAssertEqual(comment2, commentData[1])
    }

}
