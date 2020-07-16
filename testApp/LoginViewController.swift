//
//  LoginViewController.swift
//  testApp
//
//  Created by Dev on 5/20/20.
//  Copyright © 2020 Dev. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    var loginScreen : LoginScreen! {return self.view as? LoginScreen}
    unowned var loginButton: UIButton! { return loginScreen.loginButton }
    unowned var signupButton: UIButton! { return loginScreen.signupButton }

    override func loadView() {
        if let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow }){
            view = LoginScreen(frame: keyWindow.frame)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        setup()
    }
    
    func setup(){
        loginButton.addTarget(self, action: #selector(self.handleLogin), for: .touchUpInside)
        signupButton.addTarget(self, action: #selector(self.handleSignup), for: .touchUpInside)
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
