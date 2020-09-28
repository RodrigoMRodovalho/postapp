//
//  PostResponseModel.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 27/09/20.
//

import Foundation

// MARK: - PostResponseModel
struct PostResponseModel: Decodable {
    var data: [Data]?
    var total, page, limit, offset: Int?
}

// MARK: - Data
struct Data: Decodable {
    var owner: Owner?
    var id: String?
    var image: String?
    var publishDate, text: String?
    var tags: [String]?
    var link: String?
    var likes: Int?
}
