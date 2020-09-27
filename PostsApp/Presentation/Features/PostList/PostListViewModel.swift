//
//  PostListViewModel.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 26/09/20.
//

import Foundation
import RxSwift

class PostListViewModel {
    
    let disposeBag = DisposeBag()
    let useCase: GetPostUseCase
    
    init(getPostUseCase: GetPostUseCase) {
        self.useCase = getPostUseCase
    }
    
    func foo (){
        print("PostListViewModel - foo")
        useCase.run().subscribe { posts in
            print("PostListViewModel onSuccess")
            print("received posts \(posts.count)")
            posts.forEach { (post) in
                print("Post - Author Name: \(post.authorName)")
            }
        } onError: { error in
            print("PostListViewModel onError \(error)")
        }.disposed(by: disposeBag)
    }
    
}
