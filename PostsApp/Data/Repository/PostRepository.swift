//
//  PostRepository.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 26/09/20.
//

import Foundation

struct PostRepository: PostRepositoryProtocol{
    
    func fetchPostData(index: Int) -> Int {
        return index * index
    }
    
}
