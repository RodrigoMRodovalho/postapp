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
        useCase.requestValues = GetPostRequestValues(index: 2)
        useCase.run().subscribe { index in
            print("PostListViewModel onNext \(index)")
        } onError: { error in
            print("PostListViewModel onError \(error)")
        }.disposed(by: disposeBag)
    }
    
}
