//
//  PostCommentViewModelProtocol.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 04/10/20.
//

import Foundation
import RxSwift

protocol PostCommentsViewModelProtocol {
    var observePostCommentsData: PublishSubject<Result<[Comment], Error>> { get }
    func fetchComments(withPost post: Post)
}
