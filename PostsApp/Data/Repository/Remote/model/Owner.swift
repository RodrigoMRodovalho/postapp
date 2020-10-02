//
//  Owner.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 27/09/20.
//

import Foundation

struct Owner: Decodable {
    var id, email, title: String?
    var picture: String?
    var firstName, lastName: String?
}
