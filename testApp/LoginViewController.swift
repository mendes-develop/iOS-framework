//
//  LoginViewController.swift
//  testApp
//
//  Created by Dev on 5/20/20.
//  Copyright © 2020 Dev. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    var emailField = UITextField()
    var passwordField = UITextField()
    var loginButton = UIButton()
    var signupButton = UIButton()
    var signupLabel = UILabel()
    var mainStackView = UIStackView()
    var bottomStackView = UIStackView()
//    var loginAction: (()-> Void)?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .systemPurple
        prepareMainStack()
        prepareBottomStack()
    }
    
    func styleField(textField: UITextField, placeholder: String){
        textField.borderStyle = .none
        textField.layer.cornerRadius = 5
        textField.backgroundColor = UIColor(red: 216/255, green: 216/255, blue: 216/255, alpha: 0.2)
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 17)
        textField.autocorrectionType = .no
        textField.placeholder = placeholder
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        textField.leftView = paddingView
        textField.leftViewMode = .always
    }
    
    func styleButton(button: UIButton, title: String){
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.backgroundColor = .init(srgbRed: 200/255, green: 200/255, blue: 200/255, alpha: 0.8)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
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
    

    
    func addConstraints(){
        loginButton.anchor(top: nil, bottom: mainStackView.bottomAnchor, leading: mainStackView.leadingAnchor, trailing: mainStackView.trailingAnchor, size: .init(width: 0, height: 50))
        passwordField.anchor(top: nil, bottom: loginButton.topAnchor, leading: loginButton.leadingAnchor, trailing: loginButton.trailingAnchor,padding: .init(top: 0, left: 0, bottom: 10, right: 0))
        emailField.anchor(top: nil, bottom: passwordField.topAnchor, leading: passwordField.leadingAnchor, trailing: passwordField.trailingAnchor,padding: .init(top: 0, left: 0, bottom: 10, right: 0))
        passwordField.anchorSize(to: loginButton)
        emailField.anchorSize(to: passwordField)
    }
    
    func prepareMainStack(){
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        [emailField, passwordField, loginButton].forEach{mainStackView.addArrangedSubview($0)}
        mainStackView.axis = .vertical
        mainStackView.distribution = .fillProportionally
        mainStackView.spacing = 10
        view.addSubview(mainStackView)
        mainStackView.setAchor(width: view.frame.width - 60, height: 120)
        mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        styleField(textField: emailField, placeholder: "Email")
        styleField(textField: passwordField, placeholder: "Password")
        styleButton(button: loginButton, title: "Login")
        loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        addConstraints()
    }
    
    @objc func handleLogin(){
        loginButton.flash()
        guard let email = emailField.text else { return }
        guard let password = passwordField.text else { return }

        print(email, password)
        print("Login pressed")
        
    }
    
    func prepareBottomStack(){
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        [signupLabel, signupButton].forEach{bottomStackView.addArrangedSubview($0)}
        bottomStackView.axis = .horizontal
        bottomStackView.distribution = .fillProportionally
        view.addSubview(bottomStackView)
        bottomStackView.spacing = 5
        bottomStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bottomStackView.anchor(top: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, leading: nil, trailing: nil)
        
        styleText(label: signupLabel, text: "Not a member?")
        styleLink(button: signupButton, title: "SignUp")
        signupButton.addTarget(self, action: #selector(signupScreen), for: .touchUpInside)
    }
    
    @objc func signupScreen(){
        signupButton.flash()
        let signupScreen = SignupViewController()
        navigationController?.pushViewController(signupScreen, animated: true)
    }



}
