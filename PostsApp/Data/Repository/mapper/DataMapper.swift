//
//  DataMapper.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 27/09/20.
//

import Foundation

struct DataMapper {
    
    func transform(postResponseModel: PostResponseModel) -> [Post] {
        
        //TODO make post objects
        
        var postArray : [Post] = []
        
        postResponseModel.data?.forEach({ (data) in
            postArray.append(Post(authorName: data.owner?.firstName ?? ""))
        })
            
        return postArray
    }
    
}
