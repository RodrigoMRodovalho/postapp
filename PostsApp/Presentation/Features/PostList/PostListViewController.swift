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

class PostListViewController: BaseViewController<PostListViewModel>{
    
    var safeArea: UILayoutGuide!
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        let nib = UINib(nibName: "PostTableViewCell",bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "PostCell")
        return tableView
    }()

    private var data = [Post]()
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        //tableView.backgroundColor = UIColor.lightGray
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        viewModel?.observePostData.subscribe(onNext: { (result) in
            self.updateTableView(result: result)
        }).disposed(by: disposeBag)
        
    }
    
    private func updateTableView(result: Result<[Post], Error>) {
        switch result {
        case .success(let newData):
            self.data.append(contentsOf: newData)
        case .failure(_):
            //TODO handle error
            break
        }
        tableView.reloadData()
        tableView.tableFooterView = nil
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.frame
        viewModel?.fetchPosts()
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
        print("selected \(data[indexPath.row])")
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

extension PostListViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let position = scrollView.contentOffset.y
        if position > (tableView.contentSize.height - scrollView.frame.size.height - 100) {
            tableView.tableFooterView = createSpinnerFooter()
            viewModel?.fetchPosts()
        }
        
    }
}

