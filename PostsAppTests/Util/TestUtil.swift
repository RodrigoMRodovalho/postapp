//
//  TestUtil.swift
//  PostsAppTests
//
//  Created by Rodrigo Rodovalho on 02/10/20.
//

@testable import PostsApp

struct TestUtil {
    
    func createPost(_ identifier: Int) -> Post {
        return Post(id: "id\(identifier)", authorFirstName: "first\(identifier)", authorLastName: "last\(identifier)", authorEmail: "email\(identifier)", authorProfilePictureUrl: "profile\(identifier)", title: "title\(identifier)", originalUrl: "link\(identifier)", likes: identifier, createdDatetime: "time\(identifier)", tagList: ["tag\(identifier)"], imageUrl: "image\(identifier)")
    }
    
    
    func createPostResponseModel(withQuantityOfData identifier: Int) -> PostResponseModel {
        
        var dataArray = [Data]()
        for index in 1...identifier {
            dataArray.append(createPostResponseModelInnerData(index))
        }
        return PostResponseModel(data: dataArray, total: identifier, page: identifier, limit: identifier, offset: identifier)
        
    }
    
    private func createPostResponseModelInnerData(_ identifier: Int) -> Data {
        let owner = Owner(id: "id\(identifier)", email: "email\(identifier)", title: "title\(identifier)", picture: "profile\(identifier)",
                          firstName: "first\(identifier)", lastName: "last\(identifier)")
        let data = Data(owner: owner, id: "id\(identifier)", image: "image\(identifier)", publishDate: "time\(identifier)",
                        text: "title\(identifier)", tags: ["tag\(identifier)"], link: "link\(identifier)", likes: identifier)
        return data
    }
    
    func createComment(_ identifier: Int) -> Comment {
        return Comment(id: "id\(identifier)", authorFirstName: "first\(identifier)", authorLastName: "last\(identifier)",
                       authorPictureUrl: "profile\(identifier)", message: "message\(identifier)", createDatetime: "time\(identifier)")
    }
    
    func createCommentResponseModel(withQuantityOfData identifier: Int) -> CommentResponseModel {
        var dataArray = [CommentData]()
        for index in 1...identifier {
            dataArray.append(createCommentResponseModelInnerCommentData(index))
        }
        return CommentResponseModel(data: dataArray, total: identifier, page: identifier, limit: identifier, offset: identifier)
    }
    
    private func createCommentResponseModelInnerCommentData(_ identifier: Int) -> CommentData {
        let owner = Owner(id: "id\(identifier)", email: "email\(identifier)", title: "title\(identifier)", picture: "profile\(identifier)",
                          firstName: "first\(identifier)", lastName: "last\(identifier)")
        let data = CommentData(owner: owner, id: "id\(identifier)", message: "message\(identifier)", publishDate: "time\(identifier)")
        return data
    }
}
