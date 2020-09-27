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
    
    func run() -> Observable<T> {
        return executeUseCase(requestValues: requestValues)
    }
    
    func executeUseCase(requestValues: RV?) -> Observable<T> {
        return Observable.empty()
    }
    
}
