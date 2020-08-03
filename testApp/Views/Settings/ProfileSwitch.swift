//
//  ProfileCollectionViewCell.swift
//  testApp
//
//  Created by Dev on 7/25/20.
//  Copyright © 2020 Dev. All rights reserved.
//

import UIKit

class ProfileSwitch: UICollectionViewCell {
    lazy var switchControl: UISwitch = {
       let switchControl = UISwitch()
        switchControl.isOn = false
        switchControl.onTintColor = .blue
    
        switchControl.addTarget(self, action: #selector(handleSwitch), for: .valueChanged)
        return switchControl
    }()
    
    override init(frame: CGRect) {
           super.init(frame: frame)
        setup()
    }
    
    func setup(){
        self.addSubview(switchControl)
        switchControl.anchor(top: self.topAnchor, bottom: self.bottomAnchor, leading: nil, trailing: self.trailingAnchor)
//        switchControl.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        switchControl.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -12).isActive = true
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
    let inputField : UITextField = {
        let input = UITextField()
        input.style(placeholder: "Email")
        return input
    }()
    
    override init(frame: CGRect) {
              super.init(frame: frame)
           setup()
       }
    
    func setup(){
        self.addSubview(inputField)
        inputField.anchor(top: self.topAnchor, bottom: nil, leading: self.leadingAnchor, trailing: self.trailingAnchor)
    }
    
    required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
}

class ProfilePicker: UICollectionViewCell, UITextFieldDelegate {
    
    let textBox: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == textBox {
            textField.endEditing(true)
        }
    }
    
    override init(frame: CGRect) {
              super.init(frame: frame)
        textBox.delegate = self
        setup()
       }
    
    func setup(){
        self.addSubview(textBox)
        textBox.anchor(top: self.topAnchor, bottom: self.bottomAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor)
    }
    
    required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
    
    
    
    
    
    
//
//
//        func numberOfComponents(in pickerView: UIPickerView) -> Int {
//            return 1
//        }
//
//        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//            return colors.count
//        }
//
//        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//
//    //        self.endEditing(true)
//            print("hello")
//            return colors[row]
//        }
//
//        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//            self.textBox.text = self.colors[row]
//            self.pickerView.isHidden = true
//        }
//
//
//    let pickerView: UIPickerView = {
//        let pickerView = UIPickerView()
//        return pickerView
//    }()
    
}



