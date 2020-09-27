//
//  DependencyAssembler.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 26/09/20.
//

import Foundation
import Swinject

extension Assembler {
    
    static let sharedAssembler: Assembler = {
        
        let container = Container()
        let assembler = Assembler([
            
        ], container: container)
        
        return assembler
    }()
    
}
