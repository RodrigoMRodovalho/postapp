//
//  Comment.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 27/09/20.
//

import Foundation

struct Comment: Equatable {
    let id: String
    let authorFirstName: String
    let authorLastName: String
    let authorPictureUrl: String
    let message: String
    let createDatetime: String
}
