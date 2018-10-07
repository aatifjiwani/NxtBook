//
//  NativeLoginModal.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 10/3/18.
//  Copyright © 2018 Aatif Jiwani. All rights reserved.
//

import UIKit

class NativeLoginModal: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    var indexController: IndexController?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var controller: LoginController?
    
    let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "login"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Futura-Medium", size: 24)
        return label
    }()
    
    let backgroundBox = BackgroundView(frame: CGRect(x: 0, y: 0, width: 350, height: 260))
    
    let backToIndexButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("back", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura-Medium", size: 18)
        button.isMultipleTouchEnabled = true
        return button
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "email:"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Futura-Medium", size: 24)
        return label
    }()
    
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "password:"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Futura-Medium", size: 24)
        return label
    }()
    
    let usernameField = CredentialField()
    
    let passwordField: CredentialField = {
        let field = CredentialField()
        field.isSecureTextEntry = true
        return field
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = Colors.nxtBlue
        button.setTitle("Login", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura-Medium", size: 18)
        button.layer.cornerRadius = 25
        button.clipsToBounds = true
        return button
    }()
    
    func setupViews() {
        addSubview(loginLabel)
        loginLabel.anchor(topAnchor, left: nil, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        loginLabel.anchorCenterXToSuperview()
        loginLabel.sizeToFit()
        
        addSubview(backgroundBox)
        backgroundBox.anchorCenterXToSuperview()
        backgroundBox.anchor(loginLabel.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 350, heightConstant: 260)
        
        addSubview(backToIndexButton)
        backToIndexButton.anchorCenterXToSuperview()
        backToIndexButton.anchor(backgroundBox.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 40)
        
        addSubview(usernameLabel)
        usernameLabel.anchor(backgroundBox.topAnchor, left: backgroundBox.leftAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        usernameLabel.sizeToFit()
        
        addSubview(usernameField)
        usernameField.anchor(usernameLabel.bottomAnchor, left: usernameLabel.leftAnchor, bottom: nil, right: backgroundBox.rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 30)
        
        addSubview(passwordLabel)
        passwordLabel.anchor(usernameField.bottomAnchor, left: usernameLabel.leftAnchor, bottom: nil, right: nil, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        passwordLabel.sizeToFit()
        
        addSubview(passwordField)
        passwordField.anchor(passwordLabel.bottomAnchor, left: passwordLabel.leftAnchor, bottom: nil, right: backgroundBox.rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 30)
        
        addSubview(loginButton)
        loginButton.anchorCenterXToSuperview()
        loginButton.anchor(nil, left: nil, bottom: backgroundBox.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 20, rightConstant: 0, widthConstant: 100, heightConstant: 50)
        loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        backToIndexButton.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
    }
    
    @objc func handleLogin() {
        if let email = usernameField.text , let password = passwordField.text {
            APIServices.loginUser(email: email, password: password) { (response, status) in
                if status == 200 {
                    print(response!)
                    let user = User(json: response!)
                    UserDefaults.standard.setIsLoggedIn(value: true)
                    UserDefaults.standard.setUser(value: user.id!)
                    
                    let viewController = IndexController()
                    viewController.user = user
                    let transition = CATransition()
                    transition.type = kCATransitionFromBottom
                    if let window = UIApplication.shared.keyWindow {
                        window.set(rootViewController: viewController, withTransition: transition)
                    }

                    
                } else {
                    print("error")
                }
            }
        }
    }
    
    @objc func handleBack() {
        print("yo")
        controller?.handleBack()
    }
}
