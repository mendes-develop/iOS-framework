//
//  ProfileHeaderViewCell.swift
//  testApp
//
//  Created by Dev on 7/16/20.
//  Copyright © 2020 Dev. All rights reserved.
//

import UIKit

class ProfileHeaderViewCell: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        setup()
    }
    
    func setup(){
        
        func cardView(name: String) -> UIImageView {
            let view = UIImageView()
            view.image = UIImage(named: name)
            view.contentMode = .scaleAspectFill
            view.clipsToBounds = true
            view.layer.cornerRadius = 10
            return view
        }
        
        func stackView(isVertical: Bool) -> UIStackView {
             let stack = UIStackView()
             stack.axis = isVertical ? .vertical : .horizontal
             stack.alignment = .fill
             stack.spacing = 16
             stack.distribution = .fillEqually
            return stack
        }
        
        let redView = cardView(name: "dan")
        let greenView = cardView(name: "steve")
        let blueView = cardView(name: "bill")
        let purpleView = cardView(name: "jeff")
        let grayView = cardView(name: "dan")
        let magentaView = cardView(name: "dan")
        let verticalStack = stackView(isVertical: true)
        let horizontalStack = stackView(isVertical: false)
        
        [verticalStack, horizontalStack, magentaView].forEach { self.addSubview($0) }
        
        verticalStack.anchor(top: self.topAnchor, bottom: nil, leading: nil, trailing: self.trailingAnchor,padding:  .init(top: 16, left: 0, bottom: 26, right: 16),size: .init(width: self.frame.size.width/3 - 16, height: 0))
        [redView, greenView ,blueView].forEach{
            verticalStack.addArrangedSubview($0)
            $0.anchor(top: nil, bottom: nil, leading: nil, trailing: nil, size: .init(width: .zero, height: self.frame.size.width/3 - 16))
        }
        
        horizontalStack.anchor(top: blueView.topAnchor, bottom: blueView.bottomAnchor, leading: self.leadingAnchor, trailing: blueView.leadingAnchor,padding:  .init(top: 0, left: 16, bottom: 0, right: 16))
        magentaView.anchor(top: self.topAnchor, bottom: horizontalStack.topAnchor, leading: self.leadingAnchor, trailing: verticalStack.leadingAnchor,padding:  .init(top: 16, left: 16, bottom: 16, right: 16))

        
        [purpleView, grayView].forEach{ horizontalStack.addArrangedSubview($0)}

//        purpleView.anchor(top: horizontalStack.topAnchor, bottom: horizontalStack.bottomAnchor, leading: horizontalStack.leadingAnchor, trailing: nil, size: .init(width: 100, height: .zero))
//        grayView.anchor(top: horizontalStack.topAnchor, bottom: horizontalStack.bottomAnchor, leading: nil, trailing: horizontalStack.trailingAnchor, size: .init(width: 100, height: .zero))
//
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class SectionHeader: UICollectionReusableView {
     var label: UILabel = {
     let label: UILabel = UILabel()
     label.textColor = .black
     label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
     label.sizeToFit()
     return label
 }()

override init(frame: CGRect) {
     super.init(frame: frame)

     addSubview(label)

     label.translatesAutoresizingMaskIntoConstraints = false
    label.anchorSize(to: self)
//     label.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
     label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
//     label.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
}

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

