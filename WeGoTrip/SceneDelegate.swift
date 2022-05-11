//
//  SceneDelegate.swift
//  WeGoTrip
//
//  Created by Белимготов Алим Робертович on 11.05.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
      
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let navController = UINavigationController()
        let assembly = ModuleBuilder()
        let router = Router(navigationController: navController, moduleBuilder: assembly)
        router.initialViewController()
        
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }



}
