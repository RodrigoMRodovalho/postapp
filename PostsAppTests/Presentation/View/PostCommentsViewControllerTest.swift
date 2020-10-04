//
//  PostCommentsViewControllerTest.swift
//  PostsAppTests
//
//  Created by Rodrigo Rodovalho on 04/10/20.
//

import XCTest
import Swinject
import Cuckoo
import RxSwift
@testable import PostsApp

class PostCommentsViewControllerTest: XCTestCase {
    
    var sut: PostCommentsViewController!
    var viewModel: MockPostCommentsViewModelProtocol!
    var observableData: PublishSubject<Result<[Comment], Error>>!
    let testUtil = TestUtil()
    var post: Post!

    override func setUpWithError() throws {
        viewModel = MockPostCommentsViewModelProtocol()
        observableData = PublishSubject<Result<[Comment], Error>>()
        (Assembler.sharedAssembler.resolver as! Container).register(PostCommentsViewModelProtocol.self) { _ in
            return self.viewModel
        }
        stub (viewModel) { mock in
            when(mock.observePostCommentsData.get).thenReturn(observableData)
            when(mock.fetchComments(withPost: any())).thenDoNothing()
        }
        post = testUtil.createPost(1)
        sut = PostCommentsViewController()
        sut.post = post
    }

    override func tearDownWithError() throws {
        sut = nil
        viewModel = nil
        observableData = nil
        (Assembler.sharedAssembler.resolver as! Container).removeAll()
    }

    func testPostCommentsViewController_WhenValidateTableViewDelegateConfiguration_ShouldBeValid() throws {
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.scrollableTableView.delegate)
        XCTAssertTrue(sut.conforms(to: UITableViewDelegate.self))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:didSelectRowAt:))))
    }
    
    func testPostCommentsViewController_WhenValidateTableViewDataSourceConfiguration_ShouldBeValid() throws {
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.scrollableTableView.dataSource)
        XCTAssertTrue(sut.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:cellForRowAt:))))
    }
    
    func testPostCommentsViewController_WhenFetchingValidData_ShouldSetTableViewCellWithCorrectValues() throws {
    
        let commentsData = [testUtil.createComment(1), testUtil.createComment(2), testUtil.createComment(3)]
        
        stub (viewModel) { mock in
            when(mock.fetchComments(withPost: any())).then { _ in
                self.observableData.onNext(Result.success(commentsData))
            }
        }
        
        sut.loadViewIfNeeded()
        
        XCTAssertNil(sut.scrollableTableView.backgroundView)
        XCTAssertNil(sut.scrollableTableView.tableFooterView)
        
        //testTableViewCellHasReuseIdentifier
        let cell = sut.tableView(sut.scrollableTableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? CommentTableViewCell
        let actualReuseIdentifer = cell?.reuseIdentifier
        let expectedReuseIdentifier = "CommentCell"
        XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
        
        //testTableCellHasCorrectLabelText
        for i in 0..<commentsData.count {
            let cell = sut.tableView(sut.scrollableTableView, cellForRowAt: IndexPath(row: i, section: 0)) as? CommentTableViewCell
            XCTAssertEqual("\(commentsData[i].authorFirstName) \(commentsData[i].authorLastName)", cell?.authorNameLabel.text)
            XCTAssertEqual(commentsData[i].createDatetime, cell?.createdDatetimeLabel.text)
            XCTAssertEqual(commentsData[i].message, cell?.messageLabel.text)
        }
    }
}

extension Post: Matchable {
    public var matcher: ParameterMatcher<Post> {
        return ParameterMatcher { $0 == self }
    } 
}
