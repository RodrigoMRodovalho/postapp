//
//  DataMapper.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 27/09/20.
//

import Foundation

struct DataMapper {
    
    let inFormatter = DateFormatter()
    let outFormatter = DateFormatter()
    
    init() {
        inFormatter.locale = Locale(identifier: "en_US_POSIX")
        inFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        outFormatter.locale = Locale(identifier: "en_US_POSIX")
        outFormatter.dateFormat = "MM-dd-yyyy HH:mm"
    }
    
    func transform(postResponseModel: PostResponseModel) -> [Post] {
    
        var postArray : [Post] = []
        
        postResponseModel.data.forEach({ (data) in
            let post = Post(id: data.id,
                            authorFirstName: data.owner.firstName,
                            authorLastName: data.owner.lastName,
                            authorEmail: data.owner.email,
                            authorProfilePictureUrl: (data.owner.picture),
                            title: data.text,
                            originalUrl: data.link ?? "",
                            likes: data.likes,
                            createdDatetime: convertDataFormat(fromDateString: data.publishDate),
                            tagList: data.tags!,
                            imageUrl: data.image)
            postArray.append(post)
        })
            
        return postArray
    }
    
    func transform(commentResponseModel: CommentResponseModel) -> [Comment] {
        
        var commentArray : [Comment] = []
        
        commentResponseModel.data.forEach({ (data) in
            let comment = Comment(id: data.id,
                                  authorFirstName: data.owner.firstName,
                                  authorLastName: data.owner.lastName,
                                  authorPictureUrl: data.owner.picture,
                                  message: data.message,
                                  createDatetime: convertDataFormat(fromDateString: data.publishDate))
            commentArray.append(comment)
        })
        
        return commentArray
        
    }

    private func convertDataFormat(fromDateString inDate: String) -> String {
        let date = inFormatter.date(from: inDate)!
        return outFormatter.string(from: date)
    }
 
}
