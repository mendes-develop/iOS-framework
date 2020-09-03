//
//  MainPageSettingsHeaderView.swift
//  testApp
//
//  Created by Robert Mejia on 7/16/20.
//  Copyright © 2020 Dev. All rights reserved.
//

import UIKit

class MainPageSettingsHeaderView: UICollectionReusableView {
    let darkGreen = CGColor.init(srgbRed: 1 / 255.0, green: 111 / 255.0, blue: 73 / 255.0, alpha: 1)
    let lightGreen = CGColor.init(srgbRed: 205 / 255.0, green: 232 / 255.0, blue: 215 / 255.0, alpha: 1)
    
    lazy var profileImage: UIImageView = { [unowned self] in
        let imageView = UIImageView()
        let width = self.frame.height - 150
        imageView.setAchor(width: width, height: width);
        imageView.image = #imageLiteral(resourceName: "profileImage")
        imageView.layer.cornerRadius = width/2
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.backgroundColor = .white
        imageView.layer.borderColor = lightGreen
        imageView.layer.borderWidth = 3
        imageView.layer.zPosition = 1
        return imageView
    }()
    
    let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "headerbackground")
        return imageView
    }()
    
    lazy var nameLabel: UILabel = { [unowned self] in
        let label = UILabel()
        label.textColor = .init(cgColor: darkGreen)
        label.text = "Peter Rojas, 28"
        label.font = .systemFont(ofSize: 30)
        label.layer.zPosition = 1
        return label
    }()
    
    lazy var locationLabel: UILabel = { [unowned self] in
        let label = UILabel()
        label.textColor = .init(cgColor: darkGreen)
        label.text = "New York City, NY"
        label.layer.zPosition = 1
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setup()
    }
    
    func setup() {
        [profileImage, nameLabel, locationLabel, backgroundImage].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        [profileImage, nameLabel, locationLabel].forEach {
            $0.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 1).isActive = true
        }
        
        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            locationLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25),
            nameLabel.bottomAnchor.constraint(equalTo: locationLabel.topAnchor, constant: -20)
        ])

        backgroundImage.anchorSize(to: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
