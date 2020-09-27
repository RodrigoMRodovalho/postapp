//
//  DataDependencyAssembly.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 26/09/20.
//

import Foundation
import Swinject

class DataDependencyAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(PostRepositoryProtocol.self) { _ in PostRepository() }
    }
    
}
