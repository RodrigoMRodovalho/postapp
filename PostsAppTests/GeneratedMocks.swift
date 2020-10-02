// MARK: - Mocks generated from file: PostsApp/Domain/Repository/PostRepositoryProtocol.swift at 2020-10-02 03:46:25 +0000

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


// MARK: - Mocks generated from file: PostsApp/Domain/UseCases/GetPostsUseCase.swift at 2020-10-02 03:46:25 +0000

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
    

    
    
    
     override var currentPage: Int {
        get {
            return cuckoo_manager.getter("currentPage",
                superclassCall:
                    
                    super.currentPage
                    ,
                defaultCall: __defaultImplStub!.currentPage)
        }
        
        set {
            cuckoo_manager.setter("currentPage",
                value: newValue,
                superclassCall:
                    
                    super.currentPage = newValue
                    ,
                defaultCall: __defaultImplStub!.currentPage = newValue)
        }
        
    }
    
    
    
     override var isExecuting: Bool {
        get {
            return cuckoo_manager.getter("isExecuting",
                superclassCall:
                    
                    super.isExecuting
                    ,
                defaultCall: __defaultImplStub!.isExecuting)
        }
        
        set {
            cuckoo_manager.setter("isExecuting",
                value: newValue,
                superclassCall:
                    
                    super.isExecuting = newValue
                    ,
                defaultCall: __defaultImplStub!.isExecuting = newValue)
        }
        
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
	    
	    
	    var currentPage: Cuckoo.ClassToBeStubbedProperty<MockGetPostUseCase, Int> {
	        return .init(manager: cuckoo_manager, name: "currentPage")
	    }
	    
	    
	    var isExecuting: Cuckoo.ClassToBeStubbedProperty<MockGetPostUseCase, Bool> {
	        return .init(manager: cuckoo_manager, name: "isExecuting")
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
	
	    
	    
	    var currentPage: Cuckoo.VerifyProperty<Int> {
	        return .init(manager: cuckoo_manager, name: "currentPage", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var isExecuting: Cuckoo.VerifyProperty<Bool> {
	        return .init(manager: cuckoo_manager, name: "isExecuting", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func executeUseCase<M1: Cuckoo.OptionalMatchable>(requestValues: M1) -> Cuckoo.__DoNotUse<(GetPostRequestValues?), Maybe<[Post]>> where M1.OptionalMatchedType == GetPostRequestValues {
	        let matchers: [Cuckoo.ParameterMatcher<(GetPostRequestValues?)>] = [wrap(matchable: requestValues) { $0 }]
	        return cuckoo_manager.verify("executeUseCase(requestValues: GetPostRequestValues?) -> Maybe<[Post]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class GetPostUseCaseStub: GetPostUseCase {
    
    
     override var currentPage: Int {
        get {
            return DefaultValueRegistry.defaultValue(for: (Int).self)
        }
        
        set { }
        
    }
    
    
     override var isExecuting: Bool {
        get {
            return DefaultValueRegistry.defaultValue(for: (Bool).self)
        }
        
        set { }
        
    }
    

    

    
     override func executeUseCase(requestValues: GetPostRequestValues?) -> Maybe<[Post]>  {
        return DefaultValueRegistry.defaultValue(for: (Maybe<[Post]>).self)
    }
    
}


// MARK: - Mocks generated from file: PostsApp/Presentation/Features/PostComments/PostCommentsViewModel.swift at 2020-10-02 03:46:25 +0000

//
//  PostDetailViewModel.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 27/09/20.
//

import Cuckoo
@testable import PostsApp

import Foundation
import RxSwift


 class MockPostCommentslViewModel: PostCommentslViewModel, Cuckoo.ClassMock {
    
     typealias MocksType = PostCommentslViewModel
    
     typealias Stubbing = __StubbingProxy_PostCommentslViewModel
     typealias Verification = __VerificationProxy_PostCommentslViewModel

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: PostCommentslViewModel?

     func enableDefaultImplementation(_ stub: PostCommentslViewModel) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     override func fetchComments(withPost post: Post)  {
        
    return cuckoo_manager.call("fetchComments(withPost: Post)",
            parameters: (post),
            escapingParameters: (post),
            superclassCall:
                
                super.fetchComments(withPost: post)
                ,
            defaultCall: __defaultImplStub!.fetchComments(withPost: post))
        
    }
    

	 struct __StubbingProxy_PostCommentslViewModel: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func fetchComments<M1: Cuckoo.Matchable>(withPost post: M1) -> Cuckoo.ClassStubNoReturnFunction<(Post)> where M1.MatchedType == Post {
	        let matchers: [Cuckoo.ParameterMatcher<(Post)>] = [wrap(matchable: post) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockPostCommentslViewModel.self, method: "fetchComments(withPost: Post)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_PostCommentslViewModel: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func fetchComments<M1: Cuckoo.Matchable>(withPost post: M1) -> Cuckoo.__DoNotUse<(Post), Void> where M1.MatchedType == Post {
	        let matchers: [Cuckoo.ParameterMatcher<(Post)>] = [wrap(matchable: post) { $0 }]
	        return cuckoo_manager.verify("fetchComments(withPost: Post)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class PostCommentslViewModelStub: PostCommentslViewModel {
    

    

    
     override func fetchComments(withPost post: Post)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: PostsApp/Presentation/Features/PostList/PostListViewModel.swift at 2020-10-02 03:46:25 +0000

//
//  PostListViewModel.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 26/09/20.
//

import Cuckoo
@testable import PostsApp

import Foundation
import RxSwift


 class MockPostListViewModel: PostListViewModel, Cuckoo.ClassMock {
    
     typealias MocksType = PostListViewModel
    
     typealias Stubbing = __StubbingProxy_PostListViewModel
     typealias Verification = __VerificationProxy_PostListViewModel

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: PostListViewModel?

     func enableDefaultImplementation(_ stub: PostListViewModel) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     override func fetchPosts()  {
        
    return cuckoo_manager.call("fetchPosts()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.fetchPosts()
                ,
            defaultCall: __defaultImplStub!.fetchPosts())
        
    }
    

	 struct __StubbingProxy_PostListViewModel: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func fetchPosts() -> Cuckoo.ClassStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockPostListViewModel.self, method: "fetchPosts()", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_PostListViewModel: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func fetchPosts() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("fetchPosts()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class PostListViewModelStub: PostListViewModel {
    

    

    
     override func fetchPosts()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}
