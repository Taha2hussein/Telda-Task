//
//  SceneDelegate.swift
//  TeldaTask
//
//  Created by Taha Hussein on 28/11/2024.
//

import UIKit

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Check for valid window scene
        guard let windowScene = (scene as? UIWindowScene) else { return }

        // Initialize window with the correct windowScene
        window = UIWindow(windowScene: windowScene)

        let firstViewController = MovieListViewController(nibName: AppConstants.movieList.rawValue, bundle: nil)

        window?.rootViewController = firstViewController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called when the scene is disconnected from the app.
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene moves from inactive to active state.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene moves from active to inactive state.
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called when the scene moves from background to foreground.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called when the scene moves from foreground to background.
    }
}
