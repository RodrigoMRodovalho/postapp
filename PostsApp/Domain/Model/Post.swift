//
//  Post.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 27/09/20.
//

import Foundation

struct Post {
    let id: String
    let authorFirstName: String
    let authorLastName: String
    let authorEmail: String
    let authorProfilePictureUrl: String
    let title: String
    let originalUrl: String
    let likes: Int
    let createdDatetime: String
    let tagList: [String]
    let imageUrl: String
}
