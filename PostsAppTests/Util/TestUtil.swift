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
        let owner = Owner(id: "id\(identifier)", email: "email\(identifier)", title: "title\(identifier)", picture: "profile\(identifier)", firstName: "first\(identifier)", lastName: "last\(identifier)")
        let data = Data(owner: owner, id: "id\(identifier)", image: "image\(identifier)", publishDate: "time\(identifier)", text: "title\(identifier)", tags: ["tag\(identifier)"], link: "link\(identifier)", likes: identifier)
        return data
    }
    
}
