//
//  ProfileViewController.swift
//  testApp
//
//  Created by Dev on 7/16/20.
//  Copyright © 2020 Dev. All rights reserved.
//

import UIKit

struct PersonalIfo {
    var aboutMe: String
    var name: String
    var gender: String
    var sexualOrientation: String
    var interests: [String]
    var myLocation: String
    var age: Int
    var showAge: Bool
    var showLocation: Bool
}

fileprivate let switchID = "switchID"
fileprivate let headerID = "headerID"
fileprivate let sectionID = "sectionID"
fileprivate let inputID = "inputID"
fileprivate let allSections = ProfileSection.allCases

class ProfileViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UIPickerViewDelegate {
        
    let personalInfo = PersonalIfo(aboutMe: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", name: "Peter Rojas", gender: "Male", sexualOrientation: "Heterossexual", interests: ["Theater", "Music", "Fitness", "Tech"], myLocation: "Upper East Side, NY", age: 28, showAge: true, showLocation: true)

  override func viewDidLoad() {
    super.viewDidLoad()
    registerCollectionViews()
    setup()
  }

    func setup() {
        self.tabBarController?.tabBar.isHidden = true
        navigationItem.title = "Profile"
        navigationController?.navigationBar.prefersLargeTitles = true
        collectionView.backgroundColor = .white
    }
    
    func registerCollectionViews(){
        collectionView.register(ProfileHeaderViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID)
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: sectionID)
        collectionView.register(ProfileInput.self, forCellWithReuseIdentifier: inputID)
        collectionView.register(ProfileSwitch.self, forCellWithReuseIdentifier: switchID)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return allSections.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 { return 0 }
        else if allSections.count - 1 == section { return 2 }
        else { return 1 }
       }
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if indexPath.section == 0 {
            return collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID, for: indexPath) as! ProfileHeaderViewCell

        } else {
            let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: sectionID, for: indexPath) as! SectionHeader
            sectionHeader.label.text = ProfileSection(rawValue: indexPath.section)?.description
            return sectionHeader
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 { return .init(width: view.frame.width, height: view.frame.height / 2) }
        return .init(width: view.frame.width, height: 40)
    }
    
   
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell  {
        guard let section = ProfileSection(rawValue: indexPath.section) else { return UICollectionViewCell()}
        let switchCell = collectionView.dequeueReusableCell(withReuseIdentifier: switchID, for: indexPath) as! ProfileSwitch
        let inputCell = collectionView.dequeueReusableCell(withReuseIdentifier: inputID, for: indexPath) as! ProfileInput
                
        switch section {
        case .AboutMe:
            inputCell.inputField.text = personalInfo.aboutMe
            return inputCell
        case .Name:
            inputCell.inputField.text = personalInfo.name
            return inputCell
        case .Gender:
            inputCell.inputField.text = personalInfo.gender
            return inputCell
        case .SexualOrientation:
            inputCell.inputField.text = personalInfo.sexualOrientation
            return inputCell
        case .Age:
            inputCell.inputField.text = String(personalInfo.age)
            return inputCell
        case .Interests:
            inputCell.inputField.text = personalInfo.interests.joined(separator: ", ")
            return inputCell
        case .MyLocation:
            inputCell.inputField.text = personalInfo.myLocation
            return inputCell
        case .ControlProfile:
            if indexPath.row == 0 {
                switchCell.switchControl.isOn = personalInfo.showAge
                switchCell.switchLabel.text = "Show Age"
            }
            else {
                switchCell.switchControl.isOn = personalInfo.showLocation
                switchCell.switchLabel.text = "Show Location"
            }
            return switchCell
        default : return inputCell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1 { return .init(width: view.frame.width, height: 60) }
        return .init(width: view.frame.width, height: 40)
    }
    

}
