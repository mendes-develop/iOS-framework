//
//  ProfileViewController.swift
//  testApp
//
//  Created by Dev on 7/16/20.
//  Copyright © 2020 Dev. All rights reserved.
//
struct userInfo {
    
}

import UIKit

class ProfileView: UIView {
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class ProfileViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UIPickerViewDelegate {
    
    fileprivate let switchID = "switchID"
    fileprivate let headerID = "headerID"
    fileprivate let sectionID = "sectionID"
    fileprivate let inputID = "inputID"
    fileprivate let pickerID = "pickerID"
    
    var personalInfo : [String : Any] = [
        "aboutMe" : "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
        "name": "Alex Mendes",
        "gender" : "male",
        "sexualOrientation" : "straight",
        "interests" : ["Theater", "Music", "Fitness", "Tech"],
        "myLocation" : "Upper East Side, NY", // or coordinates?
        "age": 26,
        "showAge": true,
        "showLocation" : true
        ]

  
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }
    
    func setup() {
        self.tabBarController?.tabBar.isHidden = true
        navigationItem.title = "Profile"
        navigationController?.navigationBar.prefersLargeTitles = true
        collectionView.backgroundColor = .white
        collectionView.register(ProfileHeaderViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID)
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: sectionID)
        collectionView.register(ProfileInput.self, forCellWithReuseIdentifier: inputID)
        collectionView.register(ProfileSwitch.self, forCellWithReuseIdentifier: switchID)
        collectionView.register(ProfilePicker.self, forCellWithReuseIdentifier: pickerID)

    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return ProfileSection.allCases.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 { return 0 }
        return 1
       }
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        print(indexPath.section)
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
        let textCell = collectionView.dequeueReusableCell(withReuseIdentifier: pickerID, for: indexPath) as! ProfilePicker
                
        switch section {
        case .ControlProfile: return switchCell
        case .AboutMe:
            inputCell.inputField.text = self.personalInfo["aboutMe"] as? String
            return inputCell
        case .Name:
            inputCell.inputField.text = self.personalInfo["name"] as? String
            return inputCell
        case .Gender:
            inputCell.inputField.text = self.personalInfo["gender"] as? String
            return inputCell
        case .SexualOrientation:
            inputCell.inputField.text = self.personalInfo["sexualOrientation"] as? String
            return inputCell
        case .Age:
            inputCell.inputField.text = (String(describing: self.personalInfo["age"]))
            return inputCell
        case .Interests:
            inputCell.inputField.text = (self.personalInfo["interests"] as? Array)?.joined(separator: ", ")
            return inputCell
        case .MyLocation:
            inputCell.inputField.text = self.personalInfo["myLocation"] as? String
            return inputCell
        default : return inputCell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 50)
    }

}
