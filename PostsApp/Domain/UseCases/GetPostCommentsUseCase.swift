//
//  GetPostCommentsUseCase.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 27/09/20.
//

import Foundation
import RxSwift

struct GetPostCommentsRequestValues: RequestValues {
    let postId: String
}

class GetPostCommentsUseCase: UseCase<GetPostCommentsRequestValues, [Comment]> {
    
    private var currentPage = -1
    private var isExecuting = false
    let repository: PostRepositoryProtocol
    
    init (repository: PostRepositoryProtocol){
        self.repository = repository
    }
    
    override func executeUseCase(requestValues: GetPostCommentsRequestValues?) -> Maybe<[Comment]> {
        
        if (isExecuting) {
            return Maybe.empty()
        }
        
        isExecuting = true

        currentPage += 1
        return repository.fetchPostComments(withId: requestValues!.postId, limit: 10, page: currentPage).asMaybe().map {
            self.isExecuting = false
            return $0
        }
        //.delay(.seconds(5), scheduler: ConcurrentDispatchQueueScheduler(qos: .background))
    }
}
