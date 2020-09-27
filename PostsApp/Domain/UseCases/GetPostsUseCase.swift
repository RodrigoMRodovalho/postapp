//
//  GetPostsUseCase.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 26/09/20.
//

import Foundation
import RxSwift

class GetPostRequestValues: RequestValues {
    let index: Int
    
    init (index: Int){
        self.index = index
    }
}

class GetPostUseCase: UseCase<GetPostRequestValues, Int> {
    
    let repository: PostRepositoryProtocol
    
    init (repository: PostRepositoryProtocol){
        self.repository = repository
    }
    
    override func executeUseCase(requestValues: GetPostRequestValues?) -> Observable<Int> {
        return Observable.just(repository.fetchPostData(index: requestValues!.index))
    }
    
}
