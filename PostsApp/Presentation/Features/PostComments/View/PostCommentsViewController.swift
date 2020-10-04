//
//  PostDetailViewController.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 27/09/20.
//

import UIKit

class PostCommentsViewController: BaseViewController<PostCommentsViewModel> {

    var post: Post?
    private var data = [Comment]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Comments"
    
        configureView(withXibName: "CommentTableViewCell", withReusableCellIdentifier: "CommentCell")
        
        scrollableTableView.dataSource = self
        scrollableTableView.delegate = self
        
        configureScrollHandler { [weak self] in
            self?.viewModel?.fetchComments(withPost: (self?.post!)!)
        }
        
        viewModel?.observePostCommentsData.subscribe(onNext: { [weak self] (result) in
            self?.updateTableView(result: result)
        }).disposed(by: disposeBag)
        
        viewModel?.fetchComments(withPost: post!)
    
    }
    
    private func updateTableView(result: Result<[Comment], Error>) {

        scrollableTableView.backgroundView = nil
        scrollableTableView.tableFooterView = nil

        switch result {
        case .success(let newData):
            if newData.isEmpty {
                scrollableTableView.tableFooterView = createNoDataFooter(self.data.isEmpty ?
                                                                            "No comments yet" :
                                                                            "You are read all comments")
            } else {
                self.data.append(contentsOf: newData)
                scrollableTableView.reloadData()
            }
        case .failure(let e):
            //TODO handle error
            if (data.isEmpty){
                scrollableTableView.backgroundView = createErrorView(withError: e)
            } else {
                scrollableTableView.tableFooterView = createErrorView(withError: e)
            }
            break
        }
    }
    
}

extension PostCommentsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath) as! CommentTableViewCell
        let comment = data[indexPath.row]
        cell.authorNameLabel.text = "\(comment.authorFirstName) \(comment.authorLastName)"
        cell.authorPictureImageView.layer.cornerRadius = CGFloat(15)
        cell.authorPictureImageView.kf.indicatorType = .activity
        cell.authorPictureImageView.kf.setImage(with: URL(string: comment.authorPictureUrl))
        cell.createdDatetimeLabel.text = comment.createDatetime
        cell.messageLabel.text = comment.message
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
