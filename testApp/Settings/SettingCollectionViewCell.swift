//
//  SettingCollectionViewCell.swift
//  testApp
//
//  Created by Robert Mejia on 8/2/20.
//  Copyright © 2020 Dev. All rights reserved.
//

import UIKit

class SettingCollectionViewCell: UICollectionViewCell {
    let darkGreen = CGColor.init(srgbRed: 1 / 255.0, green: 111 / 255.0, blue: 73 / 255.0, alpha: 1)
    
    lazy var label: UILabel = { [unowned self] in
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .init(cgColor: self.darkGreen)
        return label
    }()
    
    
    lazy var indicator: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "nextArrow.001")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        setup()
    }
    
    func setup() {
        [label, indicator].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
            indicator.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            indicator.widthAnchor.constraint(equalToConstant: 20),
            indicator.heightAnchor.constraint(equalToConstant: 20),
            indicator.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0)
        ])
        

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
