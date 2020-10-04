//
//  UseCase.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 26/09/20.
//

import Foundation
import RxSwift

protocol RequestValues{}

class UseCase<RV: RequestValues, T> {
    
    var requestValues: RV?
    var isExecuting = false
    var currentPage = -1
    var limit = 10
    
    func run() -> Maybe<T> {
        
        if (isExecuting) {
            return Maybe.empty()
        }
        
        isExecuting = true
        currentPage += 1
        
        return executeUseCase(requestValues: requestValues)
            .delay(.seconds(4), scheduler: ConcurrentDispatchQueueScheduler(qos: .background))
            .map {
                let random = Int.random(in: 1...2)
                if (random % 2 == 0){
                    return $0
                } else {
                    throw RemoteServiceError.notConnectedToInternet
                }
            }
            .do(onNext: nil,
                afterNext: { _ in self.currentPage += 1},
                onError: nil,
                afterError: { _ in self.isExecuting = false },
                onCompleted: nil,
                afterCompleted: { self.isExecuting = false},
                onSubscribe: nil, onSubscribed: nil, onDispose: nil)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.asyncInstance)
    }
    
    func executeUseCase(requestValues: RV?) -> Maybe<T> {
        return Maybe.error(NSError())
    }
    
}
