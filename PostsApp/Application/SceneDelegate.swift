//
//  SceneDelegate.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 26/09/20.
//

import UIKit
import Swinject

class SceneDelegate: UIResponder, UIWindowSceneDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)

        self.window = window
        let splitViewController = Assembler.sharedAssembler.resolver.resolve(UISplitViewController.self)
        splitViewController?.delegate = self
        window.rootViewController = splitViewController
        window.makeKeyAndVisible()
    }
    
    func splitViewController(_ splitViewController: UISplitViewController,
                             collapseSecondary secondaryViewController: UIViewController,
                             onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}

