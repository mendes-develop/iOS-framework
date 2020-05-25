//
//  SignupViewController.swift
//  testApp
//
//  Created by Dev on 5/21/20.
//  Copyright © 2020 Dev. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    
    var signupScreen: SignupScreen!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        setup()
    }
    
    func setup(){
        let mainView = SignupScreen(frame: self.view.frame)
        self.signupScreen = mainView
        self.view.addSubview(signupScreen)
        signupScreen.signupButton.addTarget(self,action: #selector(self.handleSignup), for: .touchUpInside)
        signupScreen.loginLink.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
    }
    
    
    @objc func handleSignup(){
        let email = signupScreen.emailField.text
        let password = signupScreen.passwordField.text
        let passwordConfirmation = signupScreen.passwordConfirmation.text
        
        if !email!.isEmpty && !password!.isEmpty && password == passwordConfirmation {
            print("Hello")
        } else {
            signupScreen.errorText.isHidden = false
        }
        
    }

    @objc func handleLogin(){
        signupScreen.loginLink.flash()
        navigationController?.popViewController(animated: true)
    }
    
    
    



}
