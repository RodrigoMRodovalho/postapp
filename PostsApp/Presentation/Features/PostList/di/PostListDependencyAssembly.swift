//
//  PostListDependencyAssembly.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 26/09/20.
//

import Foundation
import Swinject

class PostListDependencyAssembly : Assembly {
    
    func assemble(container: Container) {
        container.register(PostListViewModel.self) { r in
            let useCase = r.resolve(GetPostUseCase.self)!
            return PostListViewModel(getPostUseCase: useCase)
        }
    }

}
