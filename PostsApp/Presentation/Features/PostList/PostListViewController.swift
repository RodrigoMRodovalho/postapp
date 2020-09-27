//
//  ViewController.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 26/09/20.
//

import UIKit
import Swinject
import RxSwift

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
        cell.authorNameLabel.text = data[indexPath.row].authorName
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

