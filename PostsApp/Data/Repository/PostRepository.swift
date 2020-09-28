//
//  PostRepository.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 26/09/20.
//

import Foundation
import RxSwift

struct PostRepository: PostRepositoryProtocol{
    
    let remoteService: RemoteService
    let dataMapper: DataMapper
    
    func fetchPostData(limit: Int, page: Int) -> Single<[Post]> {
        return remoteService.request(path: ApiPath.post, parameters: ["limit": "\(limit)" , "page" : "\(page)"])
            .map {
                dataMapper.transform(postResponseModel: $0)
            }
    }
    
    func fetchPostComments(withId: String, limit: Int, page: Int) -> Single<[Comment]> {
        return remoteService.request(path: ApiPath.postComment(postId: withId), parameters: ["limit": "\(limit)" , "page" : "\(page)"])
            .map {
                dataMapper.transform(commentResponseModel: $0)
            }
    }
}
