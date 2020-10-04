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
    
    let repository: PostRepositoryProtocol
    
    init (repository: PostRepositoryProtocol){
        self.repository = repository
    }
    
    override func executeUseCase(requestValues: GetPostCommentsRequestValues?) -> Maybe<[Comment]> {
        return repository.fetchPostComments(withId: requestValues!.postId, limit: limit, page: currentPage).asMaybe()
    }
}
