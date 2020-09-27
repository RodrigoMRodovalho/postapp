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
    
    func fetchPostData(limit: Int, page: Int) -> Single<[Post]> {
        return remoteService.request(path: ApiPath.post, parameters: ["limit": "\(limit)" , "page" : "\(page)"])
            .map {
                DataMapper().transform(postResponseModel: $0)
            }
    }
    
}
