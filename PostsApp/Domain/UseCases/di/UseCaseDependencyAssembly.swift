//
//  UseCaseDependencyAssembly.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 26/09/20.
//

import Foundation
import Swinject

class UseCaseDependencyAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(GetPostUseCase.self) { r in
            let repo = r.resolve(PostRepositoryProtocol.self)
            return GetPostUseCase(repository: repo!)
        }
        
        container.register(GetPostCommentsUseCase.self) { r in
            let repo = r.resolve(PostRepositoryProtocol.self)
            return GetPostCommentsUseCase(repository: repo!)
        }
    }
}
