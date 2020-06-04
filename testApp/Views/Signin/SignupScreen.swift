//
//  Signup.swift
//  testApp
//
//  Created by Dev on 5/22/20.
//  Copyright © 2020 Dev. All rights reserved.
//

import UIKit

class SignupScreen: UIView {
    
    var emailField = UITextField()
    var passwordField = UITextField()
    var passwordConfirmation = UITextField()
    var loginLink = UIButton()
    var signupButton = UIButton()
    var loginLabel = UILabel()
    var errorText = UIButton()
    var mainStackView = UIStackView()
    var bottomStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBlue
        prepareMainStack()
        prepareBottomStack()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func styleText(label: UILabel, text: String){
        label.text = text
        label.textColor = .black
        label.textAlignment = .right
    }
    
    func styleLink(button: UIButton, title: String){
        button.setTitle(title, for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.contentHorizontalAlignment = .left
    }
    
    func prepareMainStack(){
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        [errorText, emailField, passwordField,passwordConfirmation, signupButton].forEach{mainStackView.addArrangedSubview($0)}
        mainStackView.axis = .vertical
//        mainStackView.distribution = .fillProportionally
        mainStackView.spacing = 10
        self.addSubview(mainStackView)
        mainStackView.setAchor(width: self.frame.width - 60, height: 0)
        mainStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        mainStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        errorText.errorStyle()
        emailField.style(placeholder: "Email")
        passwordField.style(placeholder: "Password")
        passwordConfirmation.style(placeholder: "Password Confirmation")
        signupButton.style(title: "Sign up")
    }
    
    func prepareBottomStack(){
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        [loginLabel, loginLink].forEach{bottomStackView.addArrangedSubview($0)}
        bottomStackView.axis = .horizontal
        bottomStackView.distribution = .fillProportionally
        self.addSubview(bottomStackView)
        bottomStackView.spacing = 5
        bottomStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        bottomStackView.anchor(top: nil, bottom: self.safeAreaLayoutGuide.bottomAnchor, leading: nil, trailing: nil)
        
        styleText(label: loginLabel, text: "Already registered?")
        styleLink(button: loginLink, title: "Log in")
    }
}
