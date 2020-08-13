//
//  SceneDelegate.swift
//  CoffeEmergency
//
//  Created by Miles Au on 2020-08-13.
//  Copyright © 2020 Miles Au. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var appCoordinator: AppCoordinator?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        // create navigation controller
        let navigationController = UINavigationController()
        
        // create app coordinator using window from scene, and navigation controller
        let window = UIWindow(windowScene: scene)
        window.tintColor = UIColor(named: "BrandGreen") // change default tint color
        appCoordinator = AppCoordinator(window: window, navigationController: navigationController)
        appCoordinator?.start() // start the app coordinator
        
    }
}

