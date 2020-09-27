//
//  BaseRemoteService.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 26/09/20.
//

import Foundation
import RxSwift

struct RemoteService {
    
    static let defaultTimeout = 20.0
    
    private let timeout: TimeInterval
    
    init (timeout: TimeInterval = defaultTimeout) {
        self.timeout = timeout
    }
    
    func request<T: Decodable> (path: ApiPath,
                                method: HTTPMethod = .get,
                                parameters: [String: String] = [:]) -> Single<T> {
        
        return Single<T>.create { observer in
            
            let apiUrl = API(path: path).url
            
            guard var components = URLComponents(string: apiUrl) else {
                observer(.error(RemoteServiceError.malformedURL))
                return Disposables.create()
            }
            
            components.queryItems = parameters.keys.map {
                return URLQueryItem(name: $0, value: parameters[$0])
            }
            
            guard let url = components.url else {
                observer(.error(RemoteServiceError.malformedURL))
                return Disposables.create()
            }
            
            var request = URLRequest(url: url)
            
            request.httpMethod = method.rawValue
            request.addValue(API.appId, forHTTPHeaderField: API.headerAppId)
            
            let configuration = URLSessionConfiguration.default
            configuration.timeoutIntervalForRequest = timeout
            
            let session = URLSession(configuration: configuration)
            session.dataTask(with: request) { (data, response, error) in
                
                if let error = error as NSError? {
                    switch error.code {
                    case NSURLErrorTimedOut:
                        observer(.error(RemoteServiceError.timedOut))
                    case NSURLErrorNotConnectedToInternet:
                        observer(.error(RemoteServiceError.notConnectedToInternet))
                    default:
                        observer(.error(RemoteServiceError.unexpected))
                    }
                    return
                }
                
                guard let response = response as? HTTPURLResponse else {
                    observer(.error(RemoteServiceError.unexpected))
                    return
                }
                
                guard 200...299 ~= response.statusCode else {
                    observer(.error(RemoteServiceError.unexpected))
                    return
                }
                
                if let data = data {
                    do {
                        let jsonDecoder = JSONDecoder()
                        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                        let decodeResponse = try jsonDecoder.decode(T.self, from: data)
                        observer(.success(decodeResponse))
                    } catch {
                        observer(.error(RemoteServiceError.unparseable))
                    }
                }
            }.resume()
            
            return Disposables.create()
        }
    }
    
}
