//
//  WelcomeModal.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 9/30/18.
//  Copyright © 2018 Aatif Jiwani. All rights reserved.
//

import UIKit

class WelcomeModal: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    var controller: LoginSignupController?

    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.text = "welcome!"
        label.font = UIFont(name: "Futura-Medium", size: 24)
        return label
    }()
    
    let signUp: AccountButton = {
        let button = AccountButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 280, height: 50)
        button.setTitle("sign up", for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura-Medium", size: 30)
        return button
    }()
    
    let logIn: AccountButton = {
        let button = AccountButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 280, height: 50)
        button.setTitle("login", for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura-Medium", size: 30)
        return button
    }()
    
    let forgotPass: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.text = "forgot password?"
        label.font = UIFont(name: "Futura-Medium", size: 20)
        return label
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(welcomeLabel)
        welcomeLabel.anchorCenterXToSuperview()
        welcomeLabel.anchor(topAnchor, left: nil, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        welcomeLabel.sizeToFit()
        
        addSubview(signUp)
        signUp.anchor(welcomeLabel.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 280, heightConstant: 50)
        signUp.anchorCenterXToSuperview()
        
        addSubview(logIn)
        logIn.anchor(signUp.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 15, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 280, heightConstant: 50)
        logIn.anchorCenterXToSuperview()
        
        addSubview(forgotPass)
        forgotPass.anchor(logIn.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        forgotPass.anchorCenterXToSuperview()
        forgotPass.sizeToFit()
    }
}
