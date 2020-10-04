//
//  ViewController.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 26/09/20.
//

import UIKit
import Swinject
import RxSwift
import Kingfisher

class PostListViewController: BaseViewController<PostListViewModelProtocol>{
    
    var data = [Post]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Posts"
    
        configureView(withXibName: "PostTableViewCell", withReusableCellIdentifier: "PostCell")
        
        scrollableTableView.dataSource = self
        scrollableTableView.delegate = self
        
        configureScrollHandler { [weak self] in
            self?.viewModel?.fetchPosts()
        }
        
        viewModel?.observePostData.subscribe(onNext: { (result) in
            self.updateTableView(result: result)
        }).disposed(by: disposeBag)
        
        viewModel?.fetchPosts()
    }
    
    private func updateTableView(result: Result<[Post], Error>) {
        switch result {
        case .success(let newData):
            self.data.append(contentsOf: newData)
        case .failure(_):
            //TODO handle error
            break
        }
    
        scrollableTableView.backgroundView = nil
        scrollableTableView.reloadData()
        scrollableTableView.tableFooterView = nil
    }
    
    
}

extension PostListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostTableViewCell
        let post = data[indexPath.row]
        cell.authorNameLabel.text = "\(post.authorFirstName) \(post.authorLastName)"
        cell.authorEmailLabel.text = post.authorEmail
        cell.authorProfilePictureImageView.layer.cornerRadius = CGFloat(15)
        cell.authorProfilePictureImageView.kf.indicatorType = .activity
        cell.authorProfilePictureImageView.kf.setImage(with: URL(string: post.authorProfilePictureUrl))
        cell.postTitleLabel.text = post.title
        if (post.originalUrl.isEmpty) {
            cell.postUrlLabel.isHidden = true
        } else {
            cell.postUrlLabel.text = post.originalUrl
        }
        cell.postLikesLabel.text = "\(post.likes) Likes"
        cell.postDatetimeLabel.text = post.createdDatetime
        cell.postPictureImageView.kf.indicatorType = .activity
        cell.postPictureImageView.kf.setImage(with: URL(string: post.imageUrl))
        cell.tagView.removeAllTags()
        post.tagList.forEach { tag in
            cell.tagView.addTag(tag)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailsController = PostCommentsViewController()
        detailsController.post = data[indexPath.row]
        
        //handling navigation title for ipad, iphone is straighforward.
        if UIDevice.current.userInterfaceIdiom == .pad {
            let controller = UINavigationController(rootViewController: detailsController)
            self.showDetailViewController(controller, sender: self)
        } else {
            self.showDetailViewController(detailsController, sender: self)
        }
        
        
    }

}
