//
//  PostRepository.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 26/09/20.
//

import Foundation
import RxSwift

protocol PostRepositoryProtocol {
    func fetchPostData(limit: Int, page: Int) -> Single<[Post]>
}
