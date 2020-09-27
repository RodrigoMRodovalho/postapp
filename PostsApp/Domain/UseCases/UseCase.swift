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
    
    func run() -> Maybe<T> {
        return executeUseCase(requestValues: requestValues)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.asyncInstance)
    }
    
    func executeUseCase(requestValues: RV?) -> Maybe<T> {
        return Maybe.error(NSError())
    }
    
}
