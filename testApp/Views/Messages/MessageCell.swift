//
//  MessageViewCell.swift
//  testApp
//
//  Created by Dev on 5/25/20.
//  Copyright © 2020 Dev. All rights reserved.
//

import UIKit


class MessageCell: UICollectionViewCell {
    
    override var isHighlighted: Bool {
        didSet{
            self.backgroundColor = isHighlighted ? UIColor(red: 0, green: 134/255, blue: 249/255, alpha: 1) : UIColor.white
            self.nameLabel.textColor = isHighlighted ? UIColor.white : UIColor.black
            self.timeLabel.textColor = isHighlighted ? UIColor.white : UIColor.black
            self.messageLabel.textColor = isHighlighted ? UIColor.white : UIColor.black
        }
    }
    
    var message: Message? {
        didSet{
            nameLabel.text = message?.user?.name
            if let image  = message?.user?.profileImage {
                profileImage.image = UIImage(named: image)
            }
            messageLabel.text = message?.text
            if let date = message?.date {
                let dateFormatter = DateFormatter()
                let elapsedTimeInSeconds = Date().timeIntervalSince(date)
                let secondsInDay: TimeInterval = 60 * 60 * 24
                
                if elapsedTimeInSeconds > secondsInDay {
                    dateFormatter.dateFormat = "MM/dd/yy"
                } else if elapsedTimeInSeconds > 7 * secondsInDay {
                    dateFormatter.dateFormat = "EEE"
                } else {
                    dateFormatter.dateFormat = "h:mm a"
                }
                
                
                
                
                
                
                timeLabel.text = dateFormatter.string(from: date)
            }
        }
    }

    
    let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 34
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let dividerLine: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        return line
    }()
    

    let mainStack:UIStackView = {
        let mainStack = UIStackView()
        mainStack.axis = .vertical
//       mainStack.spacing = 5
        mainStack.distribution = .fillProportionally
        return mainStack
    }()
    
    let topStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        return stack
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
//         label.layer.borderWidth = 1
        return label
    }()
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 14)
//        label.layer.borderWidth = 1
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup(){
        self.addSubview(profileImage)
        self.addSubview(dividerLine)
        self.addSubview(mainStack)
        mainStack.addArrangedSubview(topStack)
        [nameLabel, timeLabel].forEach{topStack.addArrangedSubview($0)}
        [topStack, messageLabel].forEach{ mainStack.addArrangedSubview($0)}
        constraints()
    }
    
    func constraints(){
        profileImage.anchor(top: nil, bottom: nil, leading: self.safeAreaLayoutGuide.leadingAnchor, trailing: nil, padding: .init(top: 0, left: 12, bottom: 0, right: 0), size: .init(width: 68, height: 68))
        profileImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        dividerLine.anchor(top: nil, bottom: self.bottomAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, padding: .init(top: 0, left: 82, bottom: 0, right: 0), size: .init(width: 0, height: 1))
        
        mainStack.anchor(top: nil, bottom: nil, leading: self.leadingAnchor, trailing: self.trailingAnchor, padding: .init(top: 0, left: 90, bottom: 0, right: 12), size: .init(width: 0, height: 40))
        mainStack.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    


    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
