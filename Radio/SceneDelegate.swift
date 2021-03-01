//
//  SceneDelegate.swift
//  Radio
//
//  Created by Денис Магильницкий on 16.02.2021.
//  Copyright © 2021 Денис Магильницкий. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let mainViewModel = MainViewModel()
        let mainVC = MainViewController(viewModel: mainViewModel)
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        self.window?.overrideUserInterfaceStyle = .light
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = mainVC
    }
}

