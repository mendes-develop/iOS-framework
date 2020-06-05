//
//  ChatView.swift
//  testApp
//
//  Created by Dev on 6/4/20.
//  Copyright © 2020 Dev. All rights reserved.
//

import UIKit

class ChatView: UIView {
    
    var bottomConstraint: NSLayoutConstraint?
    
    let keyboardContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let messageTextField: UITextView = {
        let textField = UITextView()
        textField.font = UIFont.systemFont(ofSize: 16)
        return textField
    }()
    
    let sendButton: UIButton = {
        let button = UIButton()
        button.setTitle("Send", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()
    
    let inputBorder: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    
    func setUp(){
        self.addSubview(keyboardContainer)
        keyboardContainer.anchor(top: nil, bottom: nil, leading: self.leadingAnchor, trailing: self.trailingAnchor, size: .init(width: 0, height: 48))
        bottomConstraint = NSLayoutConstraint(item: keyboardContainer, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0)
        self.addConstraint(bottomConstraint!)
        keyboardContainer.addSubview(inputBorder)
        keyboardContainer.addSubview(messageTextField)
        keyboardContainer.addSubview(sendButton)
        
        inputBorder.anchor(top: keyboardContainer.topAnchor, bottom: nil, leading: keyboardContainer.leadingAnchor, trailing: keyboardContainer.trailingAnchor, size: .init(width: 0, height: 0.5))
        
        sendButton.anchor(top: inputBorder.topAnchor, bottom: keyboardContainer.bottomAnchor, leading: nil, trailing: keyboardContainer.trailingAnchor, size: .init(width: 60, height: 0))
        messageTextField.anchor(top: inputBorder.bottomAnchor, bottom: keyboardContainer.bottomAnchor, leading: keyboardContainer.leadingAnchor, trailing: sendButton.leadingAnchor, padding: .init(top: 0, left: 8, bottom: 0, right: 0))
    }
    
    
    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
