//
//  NativeSignupModal.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 10/6/18.
//  Copyright © 2018 Aatif Jiwani. All rights reserved.
//

import UIKit

class NativeSignupModal: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    var indexController: IndexController?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var controller: SignupController?
    
    let signupLabel: UILabel = {
        let label = UILabel()
        label.text = "create an account"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Futura-Medium", size: 24)
        return label
    }()
    
    let backgroundBox = BackgroundView(frame: CGRect(x: 0, y: 0, width: 350, height: 460))
    
    let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("back", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura-Medium", size: 18)
        return button
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "email:"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Futura-Medium", size: 24)
        return label
    }()
    
    let firstnameLabel: UILabel = {
        let label = UILabel()
        label.text = "first name:"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Futura-Medium", size: 24)
        return label
    }()
    
    let lastnameLabel: UILabel = {
        let label = UILabel()
        label.text = "last name:"
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
    
    let emailField = CredentialField()
    
    let firstnameField = CredentialField()
    let lastnameField = CredentialField()
    
    let passwordField: CredentialField = {
        let field = CredentialField()
        field.isSecureTextEntry = true
        return field
    }()
    
    let signupButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = Colors.nxtBlue
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura-Medium", size: 18)
        button.layer.cornerRadius = 25
        button.clipsToBounds = true
        return button
    }()
    
    func setupViews() {
        addSubview(signupLabel)
        signupLabel.anchor(topAnchor, left: nil, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        signupLabel.anchorCenterXToSuperview()
        signupLabel.sizeToFit()
        
        addSubview(backgroundBox)
        backgroundBox.anchorCenterXToSuperview()
        backgroundBox.anchor(signupLabel.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 350, heightConstant: 460)
        
        addSubview(backButton)
        backButton.anchorCenterXToSuperview()
        backButton.anchor(backgroundBox.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 40, heightConstant: 36)
        backButton.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        
        addSubview(firstnameLabel)
        firstnameLabel.anchor(backgroundBox.topAnchor, left: backgroundBox.leftAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        firstnameLabel.sizeToFit()
        
        addSubview(firstnameField)
        firstnameField.anchor(firstnameLabel.bottomAnchor, left: firstnameLabel.leftAnchor, bottom: nil, right: backgroundBox.rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 30)
        
        addSubview(lastnameLabel)
        lastnameLabel.anchor(firstnameField.bottomAnchor, left: firstnameLabel.leftAnchor, bottom: nil, right: nil, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        lastnameLabel.sizeToFit()
        
        addSubview(lastnameField)
        lastnameField.anchor(lastnameLabel.bottomAnchor, left: lastnameLabel.leftAnchor, bottom: nil, right: backgroundBox.rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 30)
        
        addSubview(emailLabel)
        emailLabel.anchor(lastnameField.bottomAnchor, left: firstnameLabel.leftAnchor, bottom: nil, right: nil, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        emailLabel.sizeToFit()
        
        addSubview(emailField)
        emailField.anchor(emailLabel.bottomAnchor, left: emailLabel.leftAnchor, bottom: nil, right: backgroundBox.rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 30)
        
        addSubview(passwordLabel)
        passwordLabel.anchor(emailField.bottomAnchor, left: emailLabel.leftAnchor, bottom: nil, right: nil, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        passwordLabel.sizeToFit()
        
        addSubview(passwordField)
        passwordField.anchor(passwordLabel.bottomAnchor, left: passwordLabel.leftAnchor, bottom: nil, right: backgroundBox.rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 30)
        
        addSubview(signupButton)
        signupButton.anchorCenterXToSuperview()
        signupButton.anchor(nil, left: nil, bottom: backgroundBox.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 20, rightConstant: 0, widthConstant: 100, heightConstant: 50)
        signupButton.addTarget(self, action: #selector(handleSignup), for: .touchUpInside)
    }
    
    @objc func handleSignup() {
        guard let email = emailField.text, let password = passwordField.text, let first = firstnameField.text, let last = lastnameField.text else {
            return
        }
        
        APIServices.signupUser(lastname: last, email: email, password: password, firstname: first) { (response, status) in
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
    
    @objc func handleBack() {
        print("yo")
        controller?.handleBack()
    }
}
