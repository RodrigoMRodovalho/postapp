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
    
    func run() -> Single<T> {
        return executeUseCase(requestValues: requestValues)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.asyncInstance)
    }
    
    func executeUseCase(requestValues: RV?) -> Single<T> {
        return Single.error(NSError())
    }
    
}
