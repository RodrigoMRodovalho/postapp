//
//  GetPostsUseCase.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 26/09/20.
//

import Foundation
import RxSwift

class GetPostRequestValues: RequestValues {}

class GetPostUseCase: UseCase<GetPostRequestValues, [Post]> {
    
    let repository: PostRepositoryProtocol
    
    init (repository: PostRepositoryProtocol){
        self.repository = repository
    }
    
    override func executeUseCase(requestValues: GetPostRequestValues?) -> Single<[Post]> {
        return repository.fetchPostData(limit: 10, page: 1)
    }
    
}
