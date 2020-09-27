//
//  SceneDelegate.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 26/09/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    let splitFactory = PostSplitFactory()

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)

        self.window = window
        window.rootViewController = splitFactory.make()
        window.makeKeyAndVisible()
    }


}

