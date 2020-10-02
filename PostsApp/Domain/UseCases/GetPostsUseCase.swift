//
//  GetPostsUseCase.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 26/09/20.
//

import Foundation
import RxSwift

struct GetPostRequestValues: RequestValues {}

class GetPostUseCase: UseCase<GetPostRequestValues, [Post]> {
    
    var currentPage = -1
    var isExecuting = false
    let repository: PostRepositoryProtocol
    
    init (repository: PostRepositoryProtocol){
        self.repository = repository
    }
    
    override func executeUseCase(requestValues: GetPostRequestValues?) -> Maybe<[Post]> {
        
        if (isExecuting) {
            return Maybe.empty()
        }
        
        isExecuting = true

        currentPage += 1
        return repository.fetchPostData(limit: 10, page: currentPage).asMaybe().map {
            self.isExecuting = false
            return $0
        }
        //.delay(.seconds(5), scheduler: ConcurrentDispatchQueueScheduler(qos: .background))
    }
    
}
