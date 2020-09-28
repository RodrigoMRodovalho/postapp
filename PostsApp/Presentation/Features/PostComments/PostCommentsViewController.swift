//
//  PostDetailViewController.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 27/09/20.
//

import UIKit

class PostCommentsViewController: BaseViewController<PostCommentslViewModel> {

    var post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Comments"
        
        viewModel?.observePostCommentsData.subscribe(onNext: { (result) in
            //handle result
        }).disposed(by: disposeBag)
        
        // Do any additional setup after loading the view.
        viewModel?.fetchComments(withPost: post!)
    }

}
