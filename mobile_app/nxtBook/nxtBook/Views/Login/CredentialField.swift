//
//  CredentialField.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 10/5/18.
//  Copyright © 2018 Aatif Jiwani. All rights reserved.
//

import UIKit

class CredentialField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10);
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    func setupViews() {
        backgroundColor = UIColor.white
        layer.masksToBounds = true
        layer.cornerRadius = 8
        
        textAlignment = .left
        
        textColor = Colors.nxtBlue
        font = UIFont(name: "Futura-Medium", size: 20)
        
    }
}
