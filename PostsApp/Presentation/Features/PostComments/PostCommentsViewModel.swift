//
//  PostDetailViewModel.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 27/09/20.
//

import Foundation
import RxSwift

class PostCommentslViewModel {
    
    let disposeBag = DisposeBag()
    let useCase: GetPostCommentsUseCase
    let observePostCommentsData: PublishSubject<Result<[Comment], Error>> = PublishSubject()
    
    init(getPostCommentsUseCase: GetPostCommentsUseCase) {
        self.useCase = getPostCommentsUseCase
    }
    
    func fetchComments(withPost post: Post){
        useCase.requestValues = GetPostCommentsRequestValues(postId: post.id)
        useCase.run().subscribe { comments in
            print("comment fetched \(comments)")
            self.observePostCommentsData.onNext(Result.success(comments))
        } onError: { error in
            print("PostListViewModel onError \(error)")
            self.observePostCommentsData.onNext(Result.failure(error))
        }.disposed(by: disposeBag)
    }
}
