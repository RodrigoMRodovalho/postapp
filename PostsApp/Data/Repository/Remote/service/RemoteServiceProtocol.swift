//
//  RemoteServiceProtocol.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 02/10/20.
//
import RxSwift

protocol RemoteServiceProtocol {
    func request<T: Decodable> (path: ApiPath, method: HTTPMethod, parameters: [String:String]) -> Single<T>
}
