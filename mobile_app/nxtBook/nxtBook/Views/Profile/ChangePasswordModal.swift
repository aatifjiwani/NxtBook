//
//  ChangePasswordModal.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 11/1/18.
//  Copyright © 2018 Aatif Jiwani. All rights reserved.
//

import UIKit

class ChangePasswordModal: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let backgroundBox: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        view.backgroundColor = Colors.nxtOrange
        return view
    }()
    
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "current password:"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Futura-Medium", size: 24)
        return label
    }()
    
    let passwordField: CredentialField = {
        let field = CredentialField()
        field.isSecureTextEntry = true
        return field
    }()
    
    let newPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "new password:"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Futura-Medium", size: 24)
        return label
    }()
    
    let newPasswordField: CredentialField = {
        let field = CredentialField()
        field.isSecureTextEntry = true
        return field
    }()
    
    let repPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "confirm new password:"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Futura-Medium", size: 24)
        return label
    }()
    
    let repPasswordField: CredentialField = {
        let field = CredentialField()
        field.isSecureTextEntry = true
        return field
    }()
    
    let changePasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = Colors.nxtBlue
        button.setTitle("Change Password", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura-Medium", size: 16)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        return button
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = Colors.nxtBlue
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura-Medium", size: 16)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        return button
    }()
    
    func setupViews() {
        addSubview(backgroundBox)
        backgroundBox.anchorCenterXToSuperview()
        backgroundBox.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        //350w-260h
        
        addSubview(passwordLabel)
        passwordLabel.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 20, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        passwordLabel.sizeToFit()
        
        addSubview(passwordField)
        passwordField.anchor(passwordLabel.bottomAnchor, left: passwordLabel.leftAnchor, bottom: nil, right: backgroundBox.rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 30)
        
        addSubview(newPasswordLabel)
        newPasswordLabel.anchor(passwordField.bottomAnchor, left: passwordField.leftAnchor, bottom: nil, right: nil, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        newPasswordLabel.sizeToFit()
        
        addSubview(newPasswordField)
        newPasswordField.anchor(newPasswordLabel.bottomAnchor, left: newPasswordLabel.leftAnchor, bottom: nil, right: backgroundBox.rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 30)
        
        addSubview(repPasswordLabel)
        repPasswordLabel.anchor(newPasswordField.bottomAnchor, left: newPasswordField.leftAnchor, bottom: nil, right: nil, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        repPasswordLabel.sizeToFit()
        
        addSubview(repPasswordField)
        repPasswordField.anchor(repPasswordLabel.bottomAnchor, left: repPasswordLabel.leftAnchor, bottom: nil, right: backgroundBox.rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 30)
        
        addSubview(changePasswordButton)
        changePasswordButton.anchor(nil, left: centerXAnchor, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: 10, bottomConstant: 20, rightConstant: 0, widthConstant: 150, heightConstant: 40)
        
        addSubview(cancelButton)
        cancelButton.anchor(nil, left: nil, bottom: bottomAnchor, right: centerXAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 20, rightConstant: 10, widthConstant: 150, heightConstant: 40)
        
//        addSubview(loginButton)
//        loginButton.anchorCenterXToSuperview()
//        loginButton.anchor(nil, left: nil, bottom: backgroundBox.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 20, rightConstant: 0, widthConstant: 100, heightConstant: 50)
//        loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
//        backToIndexButton.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
    }
}
