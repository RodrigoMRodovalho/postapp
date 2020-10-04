//
//  PostAppAssembly.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 03/10/20.
//

import Foundation
import Swinject

class PostAppAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(PostListViewController.self) { _ in
            PostListViewController()
        }
        
        container.register(UINavigationController.self) { r in
            let postListController = r.resolve(PostListViewController.self)!
            let navigationController = UINavigationController(rootViewController: postListController)
            navigationController.navigationBar.barTintColor = .systemPurple
            navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            navigationController.navigationBar.tintColor = .systemGray6
            navigationController.navigationBar.isTranslucent = false
            return navigationController
        }
        
        container.register(UISplitViewController.self) { r in
            let navigationController = r.resolve(UINavigationController.self)!
            let splitViewController = UISplitViewController()
            splitViewController.viewControllers = [navigationController]
            splitViewController.preferredDisplayMode = UISplitViewController.DisplayMode.oneBesideSecondary
            splitViewController.maximumPrimaryColumnWidth = CGFloat(MAXFLOAT);
            splitViewController.preferredPrimaryColumnWidthFraction = 0.6;
            return splitViewController
        }
        
    }
    
    
}
