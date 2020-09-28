//
//  API.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 26/09/20.
//

import Foundation

enum ApiPath {
    case post
    case postComment(postId: String)
}

struct API {
    
    private let baseUrl = "https://dummyapi.io/data/api"
    
    static let headerAppId = "app-id"
    static let appId = "5f6fb54fbf3d384bdd89e77a"
    
    private let path: ApiPath
    
    init (path: ApiPath){
        self.path = path
    }
    
    var url : String {
        
        switch path {
        case .post:
            return "\(baseUrl)/post"
        case .postComment(let postId):
            return "\(baseUrl)/post/\(postId)/comment"
        }
    }
    
}
