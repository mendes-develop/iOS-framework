//
//  LoginViewController.swift
//  testApp
//
//  Created by Dev on 5/20/20.
//  Copyright © 2020 Dev. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var loginScreen: LoginScreen!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        setup()
    }
    
    func setup(){
        let mainView = LoginScreen(frame: self.view.frame)
        self.loginScreen = mainView
        self.view.addSubview(loginScreen)
        loginScreen.loginButton.addTarget(self, action: #selector(self.handleLogin), for: .touchUpInside)
        loginScreen.signupButton.addTarget(self, action: #selector(self.handleSignup), for: .touchUpInside)
    }
    
    @objc func handleLogin(){
        loginScreen.loginButton.flash()
        
        // development purposes
        let mainTabBarController = MainTabBarController()
        self.navigationController?.pushViewController(mainTabBarController, animated: true)
        
//        guard let email = loginScreen.emailField.text, let password = loginScreen.passwordField.text else {
//            loginScreen.errorText.isHidden = false
//            return
//        }
//        let credentials = LoginData(email: email, password: password, passwordConfirmation: nil)
//        let postUser = APIRequest(endpoint: "login")
//        postUser.registerUser(credentials: credentials, completion: { result in
//            switch result {
//            case .failure(let error):
//                print(error)
//            case .success(let user):
//               print(user)
//                let mainTabBarController = MainTabBarController()
//               self.navigationController?.pushViewController(mainTabBarController, animated: true)
//            }
//        })
    }
    
    
    @objc func handleSignup(){
        loginScreen.signupButton.flash()
        let signupScreen = SignupViewController()
        navigationController?.pushViewController(signupScreen, animated: true)
    }



}
