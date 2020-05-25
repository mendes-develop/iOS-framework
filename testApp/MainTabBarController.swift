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
        let mainController = MessageViewController(collectionViewLayout: layout)
        let navigationController = UINavigationController(rootViewController: mainController)
        viewControllers  = [navigationController]
    }
    


}
