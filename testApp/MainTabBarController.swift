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
        let messagesListController = MessageViewController(collectionViewLayout: layout)
        let messagesNavigationController = UINavigationController(rootViewController: messagesListController)
        messagesNavigationController.tabBarItem.title = "Messages"
        messagesNavigationController.tabBarItem.image = UIImage(named: "chat-40")
        
        viewControllers  = [messagesNavigationController]
    }
    


}
