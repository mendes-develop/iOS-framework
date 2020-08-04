//
//  MainPageSettingCollectionViewController.swift
//  testApp
//
//  Created by Robert Mejia on 7/16/20.
//  Copyright © 2020 Dev. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class MainPageSettingCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let darkGreen = CGColor.init(srgbRed: 1 / 255.0, green: 111 / 255.0, blue: 73 / 255.0, alpha: 1)
    let lightGreen = CGColor.init(srgbRed: 205 / 255.0, green: 232 / 255.0, blue: 215 / 255.0, alpha: 1)

    let cellLabelTexts = ["Edit Info", "Preferences", "Account"]
    
    let viewControllers = ["Edit Info": UIViewController(),
                           "Preferences": UIViewController(),
                           "Account": UIViewController()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor(cgColor: lightGreen)
        setupNavigationBar()
        registerCollectionViews()
    }

    func ProfileController()-> UIViewController{
        let layout = UICollectionViewFlowLayout()
        let settingsController = ProfileViewController(collectionViewLayout: layout)
        return settingsController
    }
    
    func setupNavigationBar()  {
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.largeTitleTextAttributes = textAttributes
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = UIColor(cgColor: darkGreen)
        title = "Settings"
    }
    
    func registerCollectionViews() {
        collectionView.register(MainPageSettingsHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderView")
        collectionView!.register(SettingCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderView", for: indexPath)
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width = collectionView.safeAreaLayoutGuide.layoutFrame.width
        let height = collectionView.safeAreaLayoutGuide.layoutFrame.height / 2
        return CGSize.init(width: width, height: height)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 32, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20.0, left: 1.0, bottom: 1.0, right: 1.0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SettingCollectionViewCell
        cell.label.text = cellLabelTexts[indexPath.item]
        return cell
    }

    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! SettingCollectionViewCell
        guard let key = cell.label.text, let vc = viewControllers[key] else { return }
        vc.view.backgroundColor = .blue
        navigationController?.pushViewController(self.ProfileController(), animated: true)
    }
}
