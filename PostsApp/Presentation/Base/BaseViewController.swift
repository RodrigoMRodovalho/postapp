//
//  BaseViewController.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 26/09/20.
//

import UIKit
import Swinject
import RxSwift


class BaseViewController<VM>: UIViewController {

    let disposeBag = DisposeBag()
    var viewModel: VM?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewModel = Assembler.sharedAssembler.resolver.resolve(VM.self)
    }
    
}
