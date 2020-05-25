//
//  Extension.swift
//  testApp
//
//  Created by Dev on 5/20/20.
//  Copyright © 2020 Dev. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {

}

extension UITextField {
    
    func style(placeholder: String){
        self.borderStyle = .none
        self.layer.cornerRadius = 5
        self.backgroundColor = UIColor(red: 216/255, green: 216/255, blue: 216/255, alpha: 0.2)
        self.textColor = .black
        self.font = UIFont.systemFont(ofSize: 17)
        self.autocorrectionType = .no
        self.placeholder = placeholder
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        self.leftView = paddingView
        self.leftViewMode = .always
        self.setAchor(width: 0, height: 40)
    }
}

extension UIButton {
    func flash(){
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.3
        flash.fromValue = 1
        flash.toValue = 0.5
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.repeatCount = 1
        self.layer.add(flash, forKey: nil)
        
    }
    
    func style(title: String){
       self.setTitle(title, for: .normal)
       self.setTitleColor(.black, for: .normal)
       self.layer.backgroundColor = .init(srgbRed: 200/255, green: 200/255, blue: 200/255, alpha: 0.8)
       self.layer.borderWidth = 1
       self.layer.cornerRadius = 5
    }
    
    func errorStyle(){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle("Invalid email and password", for: .normal)
        self.setTitleColor(.darkGray, for: .normal)
        self.backgroundColor = .red
        self.layer.borderWidth = 1
        self.layer.borderColor = .init(srgbRed: 198/255, green: 133/255, blue: 234/255, alpha: 1)
        self.setAchor(width: 0, height: 40)
        self.isUserInteractionEnabled = false
        self.isHidden = true
    }
}

extension UIView {
    
    func setAchor(width: CGFloat, height: CGFloat){
        self.anchor(top: nil, bottom: nil, leading: nil, trailing: nil, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: width, height: height))
    }
    
    func anchor(top: NSLayoutYAxisAnchor?, bottom: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero){
        
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top { topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true }
        if let bottom = bottom { bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true }
        if let trailing = trailing { trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true }
        if let leading = leading { leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true }
        
        if size.width != 0 { widthAnchor.constraint(equalToConstant: size.width).isActive = true}
        if size.height != 0 { heightAnchor.constraint(equalToConstant: size.height).isActive = true}
        
    }
    
    func anchorSize(to view: UIView){
        
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
    }
    
    
    
}
