//
//  PostListViewModel.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 26/09/20.
//

import Foundation
import RxSwift


class PostListViewModel: PostListViewModelProtocol {
    
    private let disposeBag = DisposeBag()
    private let useCase: GetPostUseCase
    let observePostData: PublishSubject<Result<[Post], Error>> = PublishSubject()
    
    init(getPostUseCase: GetPostUseCase) {
        self.useCase = getPostUseCase
    }
    
    func fetchPosts(){
        useCase.run().subscribe { posts in
            self.observePostData.onNext(Result.success(posts))
        } onError: { error in
            print("PostListViewModel onError \(error)")
            self.observePostData.onNext(Result.failure(error))
        }.disposed(by: disposeBag)
    }
    
}
