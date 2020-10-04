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

    let repository: PostRepositoryProtocol
    
    init (repository: PostRepositoryProtocol){
        self.repository = repository
    }
    
    override func executeUseCase(requestValues: GetPostRequestValues?) -> Maybe<[Post]> {
        return repository.fetchPostData(limit: limit, page: currentPage).asMaybe()
    }
    
}
