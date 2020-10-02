//
//  PostDetailViewController.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 27/09/20.
//

import UIKit

class PostCommentsViewController: BaseViewController<PostCommentslViewModel> {

    var post: Post?
    private var data = [Comment]()

    var safeArea: UILayoutGuide!
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        let nib = UINib(nibName: "CommentTableViewCell",bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CommentCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Comments"
        
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        let indicator = UIActivityIndicatorView()
        tableView.backgroundView = indicator
        indicator.startAnimating()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        viewModel?.observePostCommentsData.subscribe(onNext: { (result) in
            self.updateTableView(result: result)
        }).disposed(by: disposeBag)
        
        // Do any additional setup after loading the view.
        viewModel?.fetchComments(withPost: post!)
    
    }
    
    private func updateTableView(result: Result<[Comment], Error>) {
        switch result {
        case .success(let newData):
            self.data.append(contentsOf: newData)
        case .failure(_):
            //TODO handle error
            break
        }
        tableView.backgroundView = nil
        tableView.reloadData()
        tableView.tableFooterView = nil
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

extension PostCommentsViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let position = scrollView.contentOffset.y
        if position > (tableView.contentSize.height - scrollView.frame.size.height - 100) {
            tableView.tableFooterView = createSpinnerFooter()
            viewModel?.fetchComments(withPost: post!)
        }
        
    }
}