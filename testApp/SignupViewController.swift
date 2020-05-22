//
//  SignupViewController.swift
//  testApp
//
//  Created by Dev on 5/21/20.
//  Copyright © 2020 Dev. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    
    var emailField = UITextField()
    var passwordField = UITextField()
    var passwordConfirmation = UITextField()
    var loginLink = UIButton()
    var loginButton = UIButton()
    var loginLabel = UILabel()
    var mainStackView = UIStackView()
    var bottomStackView = UIStackView()
    
    var loginController = LoginViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        prepareMainStack()
        prepareBottomStack()
    }
    
        func prepareMainStack(){
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        [emailField, passwordField,passwordConfirmation, loginButton].forEach{mainStackView.addArrangedSubview($0)}
        mainStackView.axis = .vertical
        mainStackView.distribution = .fillProportionally
        mainStackView.spacing = 10
        view.addSubview(mainStackView)
        mainStackView.setAchor(width: view.frame.width - 60, height: 120)
        mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginController.styleField(textField: emailField, placeholder: "Email")
        loginController.styleField(textField: passwordField, placeholder: "Password!")
        loginController.styleField(textField: passwordConfirmation, placeholder: "Password Confirmation")
        loginController.styleButton(button: loginButton, title: "Sign up")
        loginButton.addTarget(self, action: #selector(handleSignup), for: .touchUpInside)
        addConstraints()
    }
    
    func addConstraints(){
        loginButton.anchor(top: nil, bottom: mainStackView.bottomAnchor, leading: mainStackView.leadingAnchor, trailing: mainStackView.trailingAnchor, size: .init(width: 0, height: 50))
        
        passwordConfirmation.anchor(top: nil, bottom: loginButton.topAnchor, leading: loginButton.leadingAnchor, trailing: loginButton.trailingAnchor,padding: .init(top: 0, left: 0, bottom: 10, right: 0))
//        passwordField.anchor(top: nil, bottom: passwordConfirmation.topAnchor, leading: passwordField.leadingAnchor, trailing: passwordField.trailingAnchor)
        emailField.anchor(top: nil, bottom: passwordField.topAnchor, leading: passwordField.leadingAnchor, trailing: passwordField.trailingAnchor,padding: .init(top: 0, left: 0, bottom: 10, right: 0))
        passwordField.anchorSize(to: loginButton)
        emailField.anchorSize(to: passwordField)
    }
    
    @objc func handleSignup(){
        print("Hello")
    }
    
    func prepareBottomStack(){
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        [loginLabel, loginLink].forEach{bottomStackView.addArrangedSubview($0)}
        bottomStackView.axis = .horizontal
        bottomStackView.distribution = .fillProportionally
        view.addSubview(bottomStackView)
        bottomStackView.spacing = 5
        bottomStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bottomStackView.anchor(top: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, leading: nil, trailing: nil)
        
        loginController.styleText(label: loginLabel, text: "Already registered?")
        loginController.styleLink(button: loginLink, title: "Log in")
        loginLink.addTarget(self, action: #selector(loginScreen), for: .touchUpInside)
    }

    @objc func loginScreen(){
        loginButton.flash()
        navigationController?.popViewController(animated: true)
    }
    
    
    



}
