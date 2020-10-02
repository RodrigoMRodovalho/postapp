//
//  CommentResponseModel.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 27/09/20.
//

import Foundation

// MARK: - CommentResponseModel
struct CommentResponseModel: Decodable {
    var data: [CommentData]?
    var total, page, limit, offset: Int?
}

// MARK: - CommentData
struct CommentData: Decodable {
    var owner: Owner?
    var id, message, publishDate: String?
}
