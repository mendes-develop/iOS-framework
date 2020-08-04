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
        viewControllers  = [addMessagesController(), addSettingsController()]
    }

    func addMessagesController() -> UIViewController {
        let layout = UICollectionViewFlowLayout()
        let messagesController = MessagesViewController(collectionViewLayout: layout)
        let messagesNavController = UINavigationController(rootViewController: messagesController)
        messagesNavController.tabBarItem.title = "Messages"
        messagesNavController.tabBarItem.image = UIImage(named: "chat-40")
        return messagesNavController
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
