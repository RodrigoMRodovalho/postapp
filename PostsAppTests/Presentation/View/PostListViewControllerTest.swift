//
//  PostListViewControllerTest.swift
//  PostsAppTests
//
//  Created by Rodrigo Rodovalho on 03/10/20.
//

import XCTest
import Swinject
import Cuckoo
import RxSwift
@testable import PostsApp

class PostListViewControllerTest: XCTestCase {
    
    var sut: PostListViewController!
    var viewModel: MockPostListViewModelProtocol!
    var observableData: PublishSubject<Result<[Post], Error>>!
    let testUtil = TestUtil()

    override func setUpWithError() throws {
        viewModel = MockPostListViewModelProtocol()
        observableData = PublishSubject<Result<[Post], Error>>()
        (Assembler.sharedAssembler.resolver as! Container).register(PostListViewModelProtocol.self) { _ in
            return self.viewModel
        }
        stub (viewModel) { mock in
            when(mock.observePostData.get).thenReturn(observableData)
            when(mock.fetchPosts()).thenDoNothing()
        }
        sut = PostListViewController()
    }

    override func tearDownWithError() throws {
        sut = nil
        viewModel = nil
        observableData = nil
        (Assembler.sharedAssembler.resolver as! Container).removeAll()
    }

    func testPostListViewController_WhenValidateTableViewDelegateConfiguration_ShouldBeValid() throws {
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.tableVieww.delegate)
        XCTAssertTrue(sut.conforms(to: UITableViewDelegate.self))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:didSelectRowAt:))))
    }
    
    func testPostListViewController_WhenValidateTableViewDataSourceConfiguration_ShouldBeValid() throws {
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.tableVieww.dataSource)
        XCTAssertTrue(sut.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:cellForRowAt:))))
    }
    
    func testPostListViewController_WhenFetchingValidData_ShouldSetTableViewCellWithCorrectValues() throws {
    
        let postData = [testUtil.createPost(1), testUtil.createPost(2), testUtil.createPost(3)]
        
        stub (viewModel) { mock in
            when(mock.fetchPosts()).then { _ in
                self.observableData.onNext(Result.success(postData))
            }
        }
        
        sut.loadViewIfNeeded()
        
        XCTAssertNil(sut.tableVieww.backgroundView)
        XCTAssertNil(sut.tableVieww.tableFooterView)
        XCTAssertEqual(postData.count, sut.tableVieww.numberOfRows(inSection: 0))
        
        
        //testTableViewCellHasReuseIdentifier
        let cell = sut.tableView(sut.tableVieww, cellForRowAt: IndexPath(row: 0, section: 0)) as? PostTableViewCell
        let actualReuseIdentifer = cell?.reuseIdentifier
        let expectedReuseIdentifier = "PostCell"
        XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
        
        //testTableCellHasCorrectLabelText
        for i in 0..<postData.count {
            let cell = sut.tableView(sut.tableVieww, cellForRowAt: IndexPath(row: i, section: 0)) as? PostTableViewCell
            XCTAssertEqual(postData[i].authorEmail, cell?.authorEmailLabel.text)
            XCTAssertEqual("\(postData[i].authorFirstName) \(postData[i].authorLastName)", cell?.authorNameLabel.text)
            XCTAssertEqual(postData[i].createdDatetime, cell?.postDatetimeLabel.text)
            XCTAssertEqual(postData[i].title, cell?.postTitleLabel.text)
            XCTAssertEqual("\(postData[i].likes) Likes", cell?.postLikesLabel.text)
        }
    }

}
