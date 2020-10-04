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
    
    func run() -> Maybe<T> {
        
        if (isExecuting) {
            return Maybe.empty()
        }
        
        isExecuting = true
        
        return executeUseCase(requestValues: requestValues)
            .do(onNext: nil, afterNext: nil, onError: nil, afterError: nil, onCompleted: {
                self.isExecuting = false
            }, afterCompleted: nil, onSubscribe: nil, onSubscribed: nil, onDispose: nil)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.asyncInstance)
    }
    
    func executeUseCase(requestValues: RV?) -> Maybe<T> {
        return Maybe.error(NSError())
    }
    
}
