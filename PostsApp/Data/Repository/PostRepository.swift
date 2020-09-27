//
//  PostRepository.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 26/09/20.
//

import Foundation
import RxSwift

struct PostRepository: PostRepositoryProtocol{
    
    func fetchPostData(index: Int) -> Int {
        
//        let remoteService = RemoteService()
//        remoteService.request(path: ApiPath.post)
        
        t().subscribe()
        return index * index
    }
    
    
    func t() -> Single<PostResponseModel> {
        let remoteService = RemoteService()
        return remoteService.request(path: ApiPath.post, parameters: ["limit":"5"]).map {
            return $0
        }
    }
    
}
