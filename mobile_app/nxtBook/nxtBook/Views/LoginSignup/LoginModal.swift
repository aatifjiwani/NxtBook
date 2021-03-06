//
//  LoginModal.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 10/3/18.
//  Copyright © 2018 Aatif Jiwani. All rights reserved.
//

import UIKit

class LoginModal: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    var controller: LoginSignupController?
    
    let login: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.text = "login"
        label.font = UIFont(name: "Futura-Medium", size: 24)
        return label
    }()
    
    let backLabel: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("back", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura-Medium", size: 18)
        return button
    }()
    
    let backgroundBox: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.nxtGreen
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return view
    }()
    
    let loginAccount: AccountButton = {
        let button = AccountButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 280, height: 50)
        button.setTitle("username/password", for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura-Medium", size: 20)
        return button
    }()
    
    let venmoAccount: AccountButton = {
        let button = AccountButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 280, height: 50)
        button.setTitle("with venmo", for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura-Medium", size: 24)
        return button
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(backgroundBox)
        backgroundBox.anchor(nil, left: nil, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 300, heightConstant: 150)
        backgroundBox.anchorCenterXToSuperview()
        
        addSubview(login)
        login.anchor(nil, left: backgroundBox.leftAnchor, bottom: backgroundBox.topAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 10, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        login.sizeToFit()
        
        addSubview(backLabel)
        backLabel.anchor(nil, left: nil, bottom: backgroundBox.topAnchor, right: backgroundBox.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 5, rightConstant: 5, widthConstant: 0, heightConstant: 0)
        backLabel.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        
        addSubview(venmoAccount)
        venmoAccount.anchorCenterXToSuperview()
        venmoAccount.anchor(backgroundBox.topAnchor, left: nil, bottom: nil, right: nil, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 245, heightConstant: 45)
        
        addSubview(loginAccount)
        loginAccount.anchorCenterXToSuperview()
        loginAccount.anchor(venmoAccount.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 15, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 245, heightConstant: 45)
        loginAccount.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
    }
    
    @objc func handleBack() {
        controller?.animateBackToIndex()
    }
    
    func handleVenmo() {
        //do stuff
    }
    
    @objc func handleLogin() {
        controller?.handleNativeLogin()
    }
}

