//
//  LoginScreen.swift
//  testApp
//
//  Created by Dev on 5/22/Users/dev/Desktop/development/Framework-iOS/testApp/Views/SignupScreen.swift/20.
//  Copyright © 2020 Dev. All rights reserved.
//

import UIKit

class LoginScreen: UIView {
    
    var mainStackView = UIStackView()
    var bottomStackView = UIStackView()
    var emailField = UITextField()
    var passwordField = UITextField()
    var loginButton = UIButton()
    var signupButton = UIButton()
    var signupLabel = UILabel()
    var errorText = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemPink
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
        [errorText, emailField, passwordField, loginButton].forEach{mainStackView.addArrangedSubview($0)}
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
        loginButton.style(title: "Login")
//        addConstraints()
    }
    
//    func addConstraints(){
//        loginButton.anchor(top: nil, bottom: mainStackView.bottomAnchor, leading: mainStackView.leadingAnchor, trailing: mainStackView.trailingAnchor)
//        passwordField.anchor(top: nil, bottom: loginButton.topAnchor, leading: loginButton.leadingAnchor, trailing: loginButton.trailingAnchor)
//        emailField.anchor(top: nil, bottom: passwordField.topAnchor, leading: passwordField.leadingAnchor, trailing: passwordField.trailingAnchor)
//        passwordField.setAchor(width: 0, height: 50)
//        emailField.anchorSize(to: passwordField)
//    }
    
    func prepareBottomStack(){
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        [signupLabel, signupButton].forEach{bottomStackView.addArrangedSubview($0)}
        bottomStackView.axis = .horizontal
        bottomStackView.distribution = .fillProportionally
        self.addSubview(bottomStackView)
        bottomStackView.spacing = 5
        bottomStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        bottomStackView.anchor(top: nil, bottom: self.safeAreaLayoutGuide.bottomAnchor, leading: nil, trailing: nil)
        
        styleText(label: signupLabel, text: "Not a member?")
        styleLink(button: signupButton, title: "SignUp")
//        signupButton.addTarget(self, action: #selector(signupScreen), for: .touchUpInsself
    }

}
