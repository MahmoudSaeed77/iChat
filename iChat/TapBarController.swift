//
//  ChatController.swift
//  iChat
//
//  Created by Mohamed Ibrahem on 7/7/19.
//  Copyright © 2019 Mahmoud Saeed. All rights reserved.
//

import UIKit

class TapBarController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let viewController = SettingController()
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = "Setting"
        navController.tabBarItem.image = UIImage(named: "settings")
        
        
        viewControllers = [navController, addControllers(title: "Chat", imageName: "chat")]
    }
    
    
    func addControllers(title: String, imageName: String)-> UINavigationController {
        let viewController = UIViewController()
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        return navController
    }
    
}
