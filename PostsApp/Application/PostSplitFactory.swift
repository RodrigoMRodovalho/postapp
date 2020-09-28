//
//  PostSplitFactory.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 27/09/20.
//

import UIKit

final class PostSplitFactory {
    
    func make() -> UIViewController {
        
        let splitViewController = UISplitViewController()
        let postListController = PostListViewController()
        let navigationController = UINavigationController(rootViewController: postListController)
        navigationController.navigationBar.barTintColor = .systemPurple
        navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController.navigationBar.tintColor = .systemGray6
        navigationController.navigationBar.isTranslucent = false
        
        splitViewController.viewControllers = [navigationController]
        splitViewController.preferredDisplayMode = UISplitViewController.DisplayMode.oneBesideSecondary
        splitViewController.maximumPrimaryColumnWidth = CGFloat(MAXFLOAT);
        splitViewController.preferredPrimaryColumnWidthFraction = 0.6;

        splitViewController.delegate = self
        
        return splitViewController
    }
    
}

extension PostSplitFactory: UISplitViewControllerDelegate {
    func splitViewController(_ splitViewController: UISplitViewController,
                             collapseSecondary secondaryViewController: UIViewController,
                             onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}
