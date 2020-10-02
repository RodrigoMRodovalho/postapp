//
//  RemoteServiceError.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 26/09/20.
//

import Foundation

enum RemoteServiceError: Error {
    case notConnectedToInternet
    case timedOut
    case unexpected
    case malformedURL
    case unparseable
    case empty
}
