//
//  ViewController.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 26/09/20.
//

import UIKit
import Swinject

class PostListViewController: BaseViewController<PostListViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel?.foo()
    }    
}

