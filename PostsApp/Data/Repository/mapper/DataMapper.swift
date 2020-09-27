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
            let post = Post(authorFirstName: data.owner?.firstName ?? "",
                            authorLastName: data.owner?.lastName ?? "",
                            authorEmail: data.owner?.email ?? "",
                            authorProfilePictureUrl: (data.owner?.picture!)!,
                            title: data.text!,
                            originalUrl: data.link ?? "",
                            likes: data.likes!,
                            createdDatetime: data.publishDate!,
                            tagList: data.tags!,
                            imageUrl: data.image!)
            postArray.append(post)
        })
            
        return postArray
    }
    
}
