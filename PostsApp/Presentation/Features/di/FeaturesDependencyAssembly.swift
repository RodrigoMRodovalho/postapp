//
//  PostListDependencyAssembly.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 26/09/20.
//

import Foundation
import Swinject

class FeaturesDependencyAssembly : Assembly {
    
    func assemble(container: Container) {
        
        container.register(PostListViewModelProtocol.self) { r in
            let useCase = r.resolve(GetPostUseCase.self)!
            return PostListViewModel(getPostUseCase: useCase)
        }
        
        container.register(PostCommentslViewModel.self) { r in
            let useCase = r.resolve(GetPostCommentsUseCase.self)!
            return PostCommentslViewModel(getPostCommentsUseCase: useCase)
        }
    }

}
