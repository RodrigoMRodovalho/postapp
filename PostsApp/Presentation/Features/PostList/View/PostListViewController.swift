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
    
    var safeArea: UILayoutGuide!
    
    let tableVieww: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        let nib = UINib(nibName: "PostTableViewCell",bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "PostCell")
        return tableView
    }()
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        view.addSubview(tableVieww)
        let indicator = UIActivityIndicatorView()
        tableVieww.backgroundView = indicator
        indicator.startAnimating()
        
        tableVieww.translatesAutoresizingMaskIntoConstraints = false
        tableVieww.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableVieww.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableVieww.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableVieww.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableVieww.separatorStyle = UITableViewCell.SeparatorStyle.none
        //tableView.backgroundColor = UIColor.lightGray
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Posts"
        // Do any additional setup after loading the view.
        tableVieww.dataSource = self
        tableVieww.delegate = self
        
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
    
        tableVieww.backgroundView = nil
        tableVieww.reloadData()
        tableVieww.tableFooterView = nil
    }
    
    private func createSpinnerFooter() -> UIView {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        let spinner = UIActivityIndicatorView()
        spinner.center = footerView.center
        footerView.addSubview(spinner)
        spinner.startAnimating()
        return footerView
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
        let navigationController = UINavigationController(rootViewController: detailsController)
        self.showDetailViewController(navigationController, sender: self)
    }

}

extension PostListViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let position = scrollView.contentOffset.y
        if position > (tableVieww.contentSize.height - scrollView.frame.size.height - 100) {
            tableVieww.tableFooterView = createSpinnerFooter()
            viewModel?.fetchPosts()
        }
        
    }
}

