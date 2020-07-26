//
//  MainTabBar.swift
//  testApp
//
//  Created by Dev on 5/23/20.
//  Copyright © 2020 Dev. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        viewControllers  = [
            messagesNavigationController(),
            settingsNavigationController()
        ]
    }
    
    func messagesNavigationController() -> UINavigationController{
        let layout = UICollectionViewFlowLayout()
        let messagesListController = MessagesViewController(collectionViewLayout: layout)
        let messagesNavigationController = UINavigationController(rootViewController: messagesListController)
        messagesNavigationController.tabBarItem.title = "Messages"
        messagesNavigationController.tabBarItem.image = UIImage(named: "chat-40")
        
        return messagesNavigationController
    }
    
    func settingsNavigationController() -> UINavigationController{
        let layout = UICollectionViewFlowLayout()
        let settingsController = ProfileViewController(collectionViewLayout: layout)
        let settingsNavigationController = UINavigationController(rootViewController: settingsController)
        settingsNavigationController.tabBarItem.title = "Settings"
        settingsNavigationController.tabBarItem.image = UIImage(named: "chat-40")
        
        return settingsNavigationController
    }
    

    


}
