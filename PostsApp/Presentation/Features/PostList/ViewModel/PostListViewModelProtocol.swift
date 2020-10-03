//
//  PostListViewModelProtocol.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 03/10/20.
//
import RxSwift

protocol PostListViewModelProtocol {
    var observePostData: PublishSubject<Result<[Post], Error>> { get }
    func fetchPosts()
}
