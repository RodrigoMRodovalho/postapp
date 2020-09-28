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
        
        container.register(DataMapper.self){ _ in
            DataMapper()
        }.inObjectScope(.container)
        
        container.register(PostRepositoryProtocol.self){ r in
            let service = r.resolve(RemoteService.self)!
            let mapper = r.resolve(DataMapper.self)!
            return PostRepository(remoteService: service, dataMapper: mapper)
        }.inObjectScope(.container)
    }
    
}
