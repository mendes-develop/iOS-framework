//
//  ChatCellCollectionViewCell.swift
//  testApp
//
//  Created by Dev on 6/1/20.
//  Copyright © 2020 Dev. All rights reserved.
//

import UIKit

class ChatLogMessageCell: UICollectionViewCell {
    let profileImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 15
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let messageTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.text = "Sample"
        textView.backgroundColor = .clear
        return textView
    }()
    
    let bubbleView : UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        return view
    }()
    
    let bubbleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ChatLogMessageCell.leftBubble
        imageView.tintColor = UIColor(white: 0.90, alpha: 1)
        return imageView
    }()
    
    static let leftBubble = UIImage(named: "bubble_left")!.resizableImage(withCapInsets: UIEdgeInsets(top: 22,left: 26,bottom: 22,right: 26)).withRenderingMode(.alwaysTemplate)
    static let righBubble = UIImage(named: "bubble_right")!.resizableImage(withCapInsets: UIEdgeInsets(top: 22,left: 26,bottom: 22,right: 26)).withRenderingMode(.alwaysTemplate)
    
    override init(frame: CGRect) {
           super.init(frame: frame)
        setup()
    }
    
    func setup(){
        [bubbleView, messageTextView, profileImageView].forEach { addSubview($0) }
        bubbleView.addSubview(bubbleImage)
        profileImageView.anchor(top: nil, bottom: self.bottomAnchor, leading: self.leadingAnchor, trailing: nil,padding: .init(top: 0, left: 8, bottom: 0, right: 0), size: .init(width: 30, height: 30))
        bubbleImage.anchor(top: bubbleView.topAnchor, bottom: bubbleView.bottomAnchor, leading: bubbleView.leadingAnchor, trailing: bubbleView.trailingAnchor)
        profileImageView.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
