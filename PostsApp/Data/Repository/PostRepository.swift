//
//  PostRepository.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 26/09/20.
//

import Foundation
import RxSwift

struct PostRepository: PostRepositoryProtocol{
    
    let remoteService: RemoteServiceProtocol
    let dataMapper: DataMapper
    
    private func makeParameters(limit: Int, page: Int) -> [String:String] {
        return ["limit": "\(limit)" , "page" : "\(page)"]
    }
    
    func fetchPostData(limit: Int, page: Int) -> Single<[Post]> {
        return remoteService.request(path: ApiPath.post,
                                     method: .get,
                                     parameters: makeParameters(limit: limit, page: page))
            .map {
                dataMapper.transform(postResponseModel: $0)
            }
    }
    
    func fetchPostComments(withId: String, limit: Int, page: Int) -> Single<[Comment]> {
        return remoteService.request(path: ApiPath.postComment(postId: withId),
                                     method: .get,
                                     parameters: makeParameters(limit: limit, page: page))
            .map {
                dataMapper.transform(commentResponseModel: $0)
            }
    }
}
