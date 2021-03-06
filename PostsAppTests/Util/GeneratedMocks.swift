// MARK: - Mocks generated from file: PostsApp/Data/Repository/Remote/service/RemoteServiceProtocol.swift at 2020-10-05 02:02:39 +0000

//
//  RemoteServiceProtocol.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 02/10/20.
//

import Cuckoo
@testable import PostsApp

import RxSwift


 class MockRemoteServiceProtocol: RemoteServiceProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = RemoteServiceProtocol
    
     typealias Stubbing = __StubbingProxy_RemoteServiceProtocol
     typealias Verification = __VerificationProxy_RemoteServiceProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: RemoteServiceProtocol?

     func enableDefaultImplementation(_ stub: RemoteServiceProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func request<T: Decodable>(path: ApiPath, method: HTTPMethod, parameters: [String:String]) -> Single<T> {
        
    return cuckoo_manager.call("request(path: ApiPath, method: HTTPMethod, parameters: [String:String]) -> Single<T>",
            parameters: (path, method, parameters),
            escapingParameters: (path, method, parameters),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.request(path: path, method: method, parameters: parameters))
        
    }
    

	 struct __StubbingProxy_RemoteServiceProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func request<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable, T: Decodable>(path: M1, method: M2, parameters: M3) -> Cuckoo.ProtocolStubFunction<(ApiPath, HTTPMethod, [String:String]), Single<T>> where M1.MatchedType == ApiPath, M2.MatchedType == HTTPMethod, M3.MatchedType == [String:String] {
	        let matchers: [Cuckoo.ParameterMatcher<(ApiPath, HTTPMethod, [String:String])>] = [wrap(matchable: path) { $0.0 }, wrap(matchable: method) { $0.1 }, wrap(matchable: parameters) { $0.2 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockRemoteServiceProtocol.self, method: "request(path: ApiPath, method: HTTPMethod, parameters: [String:String]) -> Single<T>", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_RemoteServiceProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func request<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable, T: Decodable>(path: M1, method: M2, parameters: M3) -> Cuckoo.__DoNotUse<(ApiPath, HTTPMethod, [String:String]), Single<T>> where M1.MatchedType == ApiPath, M2.MatchedType == HTTPMethod, M3.MatchedType == [String:String] {
	        let matchers: [Cuckoo.ParameterMatcher<(ApiPath, HTTPMethod, [String:String])>] = [wrap(matchable: path) { $0.0 }, wrap(matchable: method) { $0.1 }, wrap(matchable: parameters) { $0.2 }]
	        return cuckoo_manager.verify("request(path: ApiPath, method: HTTPMethod, parameters: [String:String]) -> Single<T>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class RemoteServiceProtocolStub: RemoteServiceProtocol {
    

    

    
     func request<T: Decodable>(path: ApiPath, method: HTTPMethod, parameters: [String:String]) -> Single<T>  {
        return DefaultValueRegistry.defaultValue(for: (Single<T>).self)
    }
    
}


// MARK: - Mocks generated from file: PostsApp/Domain/Repository/PostRepositoryProtocol.swift at 2020-10-05 02:02:39 +0000

//
//  PostRepository.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 26/09/20.
//

import Cuckoo
@testable import PostsApp

import Foundation
import RxSwift


 class MockPostRepositoryProtocol: PostRepositoryProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = PostRepositoryProtocol
    
     typealias Stubbing = __StubbingProxy_PostRepositoryProtocol
     typealias Verification = __VerificationProxy_PostRepositoryProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: PostRepositoryProtocol?

     func enableDefaultImplementation(_ stub: PostRepositoryProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func fetchPostData(limit: Int, page: Int) -> Single<[Post]> {
        
    return cuckoo_manager.call("fetchPostData(limit: Int, page: Int) -> Single<[Post]>",
            parameters: (limit, page),
            escapingParameters: (limit, page),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.fetchPostData(limit: limit, page: page))
        
    }
    
    
    
     func fetchPostComments(withId: String, limit: Int, page: Int) -> Single<[Comment]> {
        
    return cuckoo_manager.call("fetchPostComments(withId: String, limit: Int, page: Int) -> Single<[Comment]>",
            parameters: (withId, limit, page),
            escapingParameters: (withId, limit, page),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.fetchPostComments(withId: withId, limit: limit, page: page))
        
    }
    

	 struct __StubbingProxy_PostRepositoryProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func fetchPostData<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(limit: M1, page: M2) -> Cuckoo.ProtocolStubFunction<(Int, Int), Single<[Post]>> where M1.MatchedType == Int, M2.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Int, Int)>] = [wrap(matchable: limit) { $0.0 }, wrap(matchable: page) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockPostRepositoryProtocol.self, method: "fetchPostData(limit: Int, page: Int) -> Single<[Post]>", parameterMatchers: matchers))
	    }
	    
	    func fetchPostComments<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(withId: M1, limit: M2, page: M3) -> Cuckoo.ProtocolStubFunction<(String, Int, Int), Single<[Comment]>> where M1.MatchedType == String, M2.MatchedType == Int, M3.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(String, Int, Int)>] = [wrap(matchable: withId) { $0.0 }, wrap(matchable: limit) { $0.1 }, wrap(matchable: page) { $0.2 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockPostRepositoryProtocol.self, method: "fetchPostComments(withId: String, limit: Int, page: Int) -> Single<[Comment]>", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_PostRepositoryProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func fetchPostData<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(limit: M1, page: M2) -> Cuckoo.__DoNotUse<(Int, Int), Single<[Post]>> where M1.MatchedType == Int, M2.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Int, Int)>] = [wrap(matchable: limit) { $0.0 }, wrap(matchable: page) { $0.1 }]
	        return cuckoo_manager.verify("fetchPostData(limit: Int, page: Int) -> Single<[Post]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func fetchPostComments<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(withId: M1, limit: M2, page: M3) -> Cuckoo.__DoNotUse<(String, Int, Int), Single<[Comment]>> where M1.MatchedType == String, M2.MatchedType == Int, M3.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(String, Int, Int)>] = [wrap(matchable: withId) { $0.0 }, wrap(matchable: limit) { $0.1 }, wrap(matchable: page) { $0.2 }]
	        return cuckoo_manager.verify("fetchPostComments(withId: String, limit: Int, page: Int) -> Single<[Comment]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class PostRepositoryProtocolStub: PostRepositoryProtocol {
    

    

    
     func fetchPostData(limit: Int, page: Int) -> Single<[Post]>  {
        return DefaultValueRegistry.defaultValue(for: (Single<[Post]>).self)
    }
    
     func fetchPostComments(withId: String, limit: Int, page: Int) -> Single<[Comment]>  {
        return DefaultValueRegistry.defaultValue(for: (Single<[Comment]>).self)
    }
    
}


// MARK: - Mocks generated from file: PostsApp/Domain/UseCases/GetPostCommentsUseCase.swift at 2020-10-05 02:02:39 +0000

//
//  GetPostCommentsUseCase.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 27/09/20.
//

import Cuckoo
@testable import PostsApp

import Foundation
import RxSwift


 class MockGetPostCommentsUseCase: GetPostCommentsUseCase, Cuckoo.ClassMock {
    
     typealias MocksType = GetPostCommentsUseCase
    
     typealias Stubbing = __StubbingProxy_GetPostCommentsUseCase
     typealias Verification = __VerificationProxy_GetPostCommentsUseCase

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: GetPostCommentsUseCase?

     func enableDefaultImplementation(_ stub: GetPostCommentsUseCase) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     override func executeUseCase(requestValues: GetPostCommentsRequestValues?) -> Maybe<[Comment]> {
        
    return cuckoo_manager.call("executeUseCase(requestValues: GetPostCommentsRequestValues?) -> Maybe<[Comment]>",
            parameters: (requestValues),
            escapingParameters: (requestValues),
            superclassCall:
                
                super.executeUseCase(requestValues: requestValues)
                ,
            defaultCall: __defaultImplStub!.executeUseCase(requestValues: requestValues))
        
    }
    

	 struct __StubbingProxy_GetPostCommentsUseCase: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func executeUseCase<M1: Cuckoo.OptionalMatchable>(requestValues: M1) -> Cuckoo.ClassStubFunction<(GetPostCommentsRequestValues?), Maybe<[Comment]>> where M1.OptionalMatchedType == GetPostCommentsRequestValues {
	        let matchers: [Cuckoo.ParameterMatcher<(GetPostCommentsRequestValues?)>] = [wrap(matchable: requestValues) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGetPostCommentsUseCase.self, method: "executeUseCase(requestValues: GetPostCommentsRequestValues?) -> Maybe<[Comment]>", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_GetPostCommentsUseCase: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func executeUseCase<M1: Cuckoo.OptionalMatchable>(requestValues: M1) -> Cuckoo.__DoNotUse<(GetPostCommentsRequestValues?), Maybe<[Comment]>> where M1.OptionalMatchedType == GetPostCommentsRequestValues {
	        let matchers: [Cuckoo.ParameterMatcher<(GetPostCommentsRequestValues?)>] = [wrap(matchable: requestValues) { $0 }]
	        return cuckoo_manager.verify("executeUseCase(requestValues: GetPostCommentsRequestValues?) -> Maybe<[Comment]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class GetPostCommentsUseCaseStub: GetPostCommentsUseCase {
    

    

    
     override func executeUseCase(requestValues: GetPostCommentsRequestValues?) -> Maybe<[Comment]>  {
        return DefaultValueRegistry.defaultValue(for: (Maybe<[Comment]>).self)
    }
    
}


// MARK: - Mocks generated from file: PostsApp/Domain/UseCases/GetPostsUseCase.swift at 2020-10-05 02:02:39 +0000

//
//  GetPostsUseCase.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 26/09/20.
//

import Cuckoo
@testable import PostsApp

import Foundation
import RxSwift


 class MockGetPostUseCase: GetPostUseCase, Cuckoo.ClassMock {
    
     typealias MocksType = GetPostUseCase
    
     typealias Stubbing = __StubbingProxy_GetPostUseCase
     typealias Verification = __VerificationProxy_GetPostUseCase

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: GetPostUseCase?

     func enableDefaultImplementation(_ stub: GetPostUseCase) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     override func executeUseCase(requestValues: GetPostRequestValues?) -> Maybe<[Post]> {
        
    return cuckoo_manager.call("executeUseCase(requestValues: GetPostRequestValues?) -> Maybe<[Post]>",
            parameters: (requestValues),
            escapingParameters: (requestValues),
            superclassCall:
                
                super.executeUseCase(requestValues: requestValues)
                ,
            defaultCall: __defaultImplStub!.executeUseCase(requestValues: requestValues))
        
    }
    

	 struct __StubbingProxy_GetPostUseCase: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func executeUseCase<M1: Cuckoo.OptionalMatchable>(requestValues: M1) -> Cuckoo.ClassStubFunction<(GetPostRequestValues?), Maybe<[Post]>> where M1.OptionalMatchedType == GetPostRequestValues {
	        let matchers: [Cuckoo.ParameterMatcher<(GetPostRequestValues?)>] = [wrap(matchable: requestValues) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGetPostUseCase.self, method: "executeUseCase(requestValues: GetPostRequestValues?) -> Maybe<[Post]>", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_GetPostUseCase: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func executeUseCase<M1: Cuckoo.OptionalMatchable>(requestValues: M1) -> Cuckoo.__DoNotUse<(GetPostRequestValues?), Maybe<[Post]>> where M1.OptionalMatchedType == GetPostRequestValues {
	        let matchers: [Cuckoo.ParameterMatcher<(GetPostRequestValues?)>] = [wrap(matchable: requestValues) { $0 }]
	        return cuckoo_manager.verify("executeUseCase(requestValues: GetPostRequestValues?) -> Maybe<[Post]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class GetPostUseCaseStub: GetPostUseCase {
    

    

    
     override func executeUseCase(requestValues: GetPostRequestValues?) -> Maybe<[Post]>  {
        return DefaultValueRegistry.defaultValue(for: (Maybe<[Post]>).self)
    }
    
}


// MARK: - Mocks generated from file: PostsApp/Presentation/Features/PostComments/ViewModel/PostCommentsViewModelProtocol.swift at 2020-10-05 02:02:39 +0000

//
//  PostCommentViewModelProtocol.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 04/10/20.
//

import Cuckoo
@testable import PostsApp

import Foundation
import RxSwift


 class MockPostCommentsViewModelProtocol: PostCommentsViewModelProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = PostCommentsViewModelProtocol
    
     typealias Stubbing = __StubbingProxy_PostCommentsViewModelProtocol
     typealias Verification = __VerificationProxy_PostCommentsViewModelProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: PostCommentsViewModelProtocol?

     func enableDefaultImplementation(_ stub: PostCommentsViewModelProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     var observePostCommentsData: PublishSubject<Result<[Comment], Error>> {
        get {
            return cuckoo_manager.getter("observePostCommentsData",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.observePostCommentsData)
        }
        
    }
    

    

    
    
    
     func fetchComments(withPost post: Post)  {
        
    return cuckoo_manager.call("fetchComments(withPost: Post)",
            parameters: (post),
            escapingParameters: (post),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.fetchComments(withPost: post))
        
    }
    

	 struct __StubbingProxy_PostCommentsViewModelProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var observePostCommentsData: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockPostCommentsViewModelProtocol, PublishSubject<Result<[Comment], Error>>> {
	        return .init(manager: cuckoo_manager, name: "observePostCommentsData")
	    }
	    
	    
	    func fetchComments<M1: Cuckoo.Matchable>(withPost post: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(Post)> where M1.MatchedType == Post {
	        let matchers: [Cuckoo.ParameterMatcher<(Post)>] = [wrap(matchable: post) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockPostCommentsViewModelProtocol.self, method: "fetchComments(withPost: Post)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_PostCommentsViewModelProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var observePostCommentsData: Cuckoo.VerifyReadOnlyProperty<PublishSubject<Result<[Comment], Error>>> {
	        return .init(manager: cuckoo_manager, name: "observePostCommentsData", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func fetchComments<M1: Cuckoo.Matchable>(withPost post: M1) -> Cuckoo.__DoNotUse<(Post), Void> where M1.MatchedType == Post {
	        let matchers: [Cuckoo.ParameterMatcher<(Post)>] = [wrap(matchable: post) { $0 }]
	        return cuckoo_manager.verify("fetchComments(withPost: Post)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class PostCommentsViewModelProtocolStub: PostCommentsViewModelProtocol {
    
    
     var observePostCommentsData: PublishSubject<Result<[Comment], Error>> {
        get {
            return DefaultValueRegistry.defaultValue(for: (PublishSubject<Result<[Comment], Error>>).self)
        }
        
    }
    

    

    
     func fetchComments(withPost post: Post)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: PostsApp/Presentation/Features/PostList/ViewModel/PostListViewModelProtocol.swift at 2020-10-05 02:02:39 +0000

//
//  PostListViewModelProtocol.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 03/10/20.
//

import Cuckoo
@testable import PostsApp

import RxSwift


 class MockPostListViewModelProtocol: PostListViewModelProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = PostListViewModelProtocol
    
     typealias Stubbing = __StubbingProxy_PostListViewModelProtocol
     typealias Verification = __VerificationProxy_PostListViewModelProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: PostListViewModelProtocol?

     func enableDefaultImplementation(_ stub: PostListViewModelProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     var observePostData: PublishSubject<Result<[Post], Error>> {
        get {
            return cuckoo_manager.getter("observePostData",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.observePostData)
        }
        
    }
    

    

    
    
    
     func fetchPosts()  {
        
    return cuckoo_manager.call("fetchPosts()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.fetchPosts())
        
    }
    

	 struct __StubbingProxy_PostListViewModelProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var observePostData: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockPostListViewModelProtocol, PublishSubject<Result<[Post], Error>>> {
	        return .init(manager: cuckoo_manager, name: "observePostData")
	    }
	    
	    
	    func fetchPosts() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockPostListViewModelProtocol.self, method: "fetchPosts()", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_PostListViewModelProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var observePostData: Cuckoo.VerifyReadOnlyProperty<PublishSubject<Result<[Post], Error>>> {
	        return .init(manager: cuckoo_manager, name: "observePostData", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func fetchPosts() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("fetchPosts()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class PostListViewModelProtocolStub: PostListViewModelProtocol {
    
    
     var observePostData: PublishSubject<Result<[Post], Error>> {
        get {
            return DefaultValueRegistry.defaultValue(for: (PublishSubject<Result<[Post], Error>>).self)
        }
        
    }
    

    

    
     func fetchPosts()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}

