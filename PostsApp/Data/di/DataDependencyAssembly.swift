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
        
        container.register(RemoteService.self){ _ in
            RemoteService()
        }.inObjectScope(.container)
        
        container.register(PostRepositoryProtocol.self){ r in
            let service = r.resolve(RemoteService.self)!
            return PostRepository(remoteService: service)
        }.inObjectScope(.container)
    }
    
}
