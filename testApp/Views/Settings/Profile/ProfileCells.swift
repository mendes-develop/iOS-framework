//
//  ProfileCollectionViewCell.swift
//  testApp
//
//  Created by Dev on 7/25/20.
//  Copyright © 2020 Dev. All rights reserved.
//

import UIKit

class ProfileSwitch: UICollectionViewCell {
    let lightGreen = UIColor(red: 1 / 255.0, green: 111 / 255.0, blue: 73 / 255.0, alpha: 1)
    
    lazy var switchControl: UISwitch = {
       let switchControl = UISwitch()
        switchControl.isOn = false
        switchControl.onTintColor = self.lightGreen
        switchControl.addTarget(self, action: #selector(handleSwitch), for: .valueChanged)
        return switchControl
    }()
    
    lazy var switchLabel: UILabel = {
        let label = UILabel()
        label.text = "Label"
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        return label
    }()
    
    override init(frame: CGRect) {
           super.init(frame: frame)
        setup()
    }
    
    func setup(){
        addSubview(switchControl)
        addSubview(switchLabel)
        switchControl.anchor(top: topAnchor, bottom: bottomAnchor, leading: nil, trailing: trailingAnchor, padding: .init(top: 12, left: 0, bottom: 0, right: 12))
        switchLabel.anchor(top: topAnchor, bottom: bottomAnchor, leading: leadingAnchor, trailing: nil, padding: .init(top: 0, left: 12, bottom: 0, right: 0))
    }
    

    @objc func handleSwitch(sender: UISwitch){
        if sender.isOn {print("On")}
        else {print("OFF")}
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ProfileInput: UICollectionViewCell {
    let inputField : UITextView = {
        let input = UITextView()
        input.font = UIFont.preferredFont(forTextStyle: .subheadline)
        input.textColor = .black
        return input
    }()
    
    override init(frame: CGRect) {
              super.init(frame: frame)
           setup()
       }
    
    func setup(){
        backgroundColor = .white
        self.addSubview(inputField)
        inputField.anchor(top: self.topAnchor, bottom: bottomAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, padding: .init(top: 0, left: 8, bottom: 0, right: 8))
    }
    
    required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
}


