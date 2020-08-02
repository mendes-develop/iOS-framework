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
        
        let layout = UICollectionViewFlowLayout()
        let messagesListController = MessagesViewController(collectionViewLayout: layout)
        let messagesNavigationController = UINavigationController(rootViewController: messagesListController)
        messagesNavigationController.tabBarItem.title = "Messages"
        messagesNavigationController.tabBarItem.image = UIImage(named: "chat-40")
        
        viewControllers  = [messagesNavigationController, addSettingsController()]
    }
    
    func addSettingsController() -> UIViewController {
        let layout = UICollectionViewFlowLayout()
        let settingController = MainPageSettingCollectionViewController(collectionViewLayout: layout)
        let settingNavController = UINavigationController(rootViewController: settingController)
        settingController.tabBarItem.image = #imageLiteral(resourceName: "icons8-settings-24")
        settingController.tabBarItem.title = "Settings"
        return settingNavController;
    }
}
