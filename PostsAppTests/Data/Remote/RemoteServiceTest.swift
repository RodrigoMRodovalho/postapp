//
//  RemoteServiceTest.swift
//  PostsAppTests
//
//  Created by Rodrigo Rodovalho on 02/10/20.
//

import XCTest
import Cuckoo
import RxBlocking
import RxSwift
@testable import PostsApp

class RemoteServiceTest: XCTestCase {
    
    var sut: RemoteService!
    var configuration: URLSessionConfiguration!
    
    override func setUpWithError() throws {
        configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [MockURLProtocol.self]
        sut = RemoteService(urlSessionConfiguration: configuration)
    }

    override func tearDownWithError() throws {
        sut = nil
        configuration = nil
    }

    func testRemoteService_WhenRequestingDataWithSuccess_ShouldReturnParsedData() throws {
        
        let requestDataLimit = 10
        let requestPageIndex = 1
        let apiPath = ApiPath.post
        
        MockURLProtocol.requestHandler = { request in
            guard let url = request.url , url == URL(string: "\(API(path: apiPath).url)?limit=\(requestDataLimit)&page=\(requestPageIndex)") else {
                throw RemoteServiceError.malformedURL
            }
            
            let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return (response, self.createFakePostResponseWithValidData())
        }
        
        let apiResponse = try XCTUnwrap(requestPost(path: apiPath,
                                          method: .get,
                                          parameters: ["limit":"\(requestDataLimit)", "page":"\(requestPageIndex)"])
                                .toBlocking().last())
        
        XCTAssertEqual(2, apiResponse.data.count)
        
        for i in 0..<apiResponse.data.count {
            XCTAssertEqual("id\(i)", apiResponse.data[i].id)
            XCTAssertEqual("image\(i)", apiResponse.data[i].image)
            XCTAssertEqual("text\(i)", apiResponse.data[i].text)
            XCTAssertEqual(i, apiResponse.data[i].likes)
            XCTAssertEqual("link\(i)", apiResponse.data[i].link)
            XCTAssertEqual("owner_id\(i)", apiResponse.data[i].owner.id)
            XCTAssertEqual("owner_email\(i)", apiResponse.data[i].owner.email)
            XCTAssertEqual("owner_first\(i)", apiResponse.data[i].owner.firstName)
            XCTAssertEqual("owner_last\(i)", apiResponse.data[i].owner.lastName)
            XCTAssertEqual("owner_picture\(i)", apiResponse.data[i].owner.picture)
            XCTAssertEqual("date\(i)", apiResponse.data[i].publishDate)
            XCTAssertEqual("tag\(i)", apiResponse.data[i].tags![0])
        }
    }
    
    func testRemoteService_WhenRequestingDataWithFailure_ShouldReturnParserError() throws {
        
        let requestDataLimit = 10
        let requestPageIndex = 1
        let apiPath = ApiPath.post
        
        MockURLProtocol.requestHandler = { request in
            guard let url = request.url , url == URL(string: "\(API(path: apiPath).url)?limit=\(requestDataLimit)&page=\(requestPageIndex)") else {
                throw RemoteServiceError.malformedURL
            }
            
            let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return (response, self.createFakePostResponseWithInvalidDataNoOwner())
        }
                
        XCTAssertThrowsError(
            try requestPost(path: apiPath,
                            method: .get,
                            parameters: ["limit":"\(requestDataLimit)", "page":"\(requestPageIndex)"])
                .toBlocking().last(), "error") { (error) in
            XCTAssertEqual(RemoteServiceError.unparseable, error as! RemoteServiceError)
        }
        
    }
    
    private func createFakePostResponseWithValidData()-> Foundation.Data {
        let jsonString = """
                     {
                         "data": [
                             {
                                 "owner": {
                                     "id": "owner_id0",
                                     "email": "owner_email0",
                                     "title": "mrs",
                                     "picture": "owner_picture0",
                                     "firstName": "owner_first0",
                                     "lastName": "owner_last0"
                                 },
                                 "id": "id0",
                                 "image": "image0",
                                 "publishDate": "date0",
                                 "text": "text0",
                                 "tags": [
                                     "tag0"
                                 ],
                                 "link": "link0",
                                 "likes": 0
                             },
                              {
                                  "owner": {
                                      "id": "owner_id1",
                                      "email": "owner_email1",
                                      "title": "mrs",
                                      "picture": "owner_picture1",
                                      "firstName": "owner_first1",
                                      "lastName": "owner_last1"
                                  },
                                  "id": "id1",
                                  "image": "image1",
                                  "publishDate": "date1",
                                  "text": "text1",
                                  "tags": [
                                      "tag1"
                                  ],
                                  "link": "link1",
                                  "likes": 1
                              }
                         ],
                         "total": 884,
                         "page": 1,
                         "limit": 10,
                         "offset": 0
                     }
                     """
        
        return jsonString.data(using: .utf8)!
    }
    
    private func createFakePostResponseWithInvalidDataNoOwner()-> Foundation.Data {
        let jsonString = """
                     {
                         "data": [
                                 "id": "id0",
                                 "image": "image0",
                                 "publishDate": "date0",
                                 "text": "text0",
                                 "tags": [
                                     "tag0"
                                 ],
                                 "link": "link0",
                                 "likes": 0
                             },
                              {
                                  "id": "id1",
                                  "image": "image1",
                                  "publishDate": "date1",
                                  "text": "text1",
                                  "tags": [
                                      "tag1"
                                  ],
                                  "link": "link1",
                                  "likes": 1
                              }
                         ],
                         "total": 884,
                         "page": 1,
                         "limit": 10,
                         "offset": 0
                     }
                     """
        
        return jsonString.data(using: .utf8)!
    }
    
    
    //Wrap for generics resolution
    private func requestPost(path: ApiPath, method: HTTPMethod, parameters: [String:String]) -> Single<PostResponseModel> {
        return sut.request(path: path, method: method, parameters: parameters)
    }
    
}

