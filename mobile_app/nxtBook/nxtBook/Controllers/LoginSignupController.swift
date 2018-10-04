//
//  LoginSignupController.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 9/30/18.
//  Copyright © 2018 Aatif Jiwani. All rights reserved.
//

import UIKit

class LoginSignupController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    let nxtLabel: UILabel = {
        let label = UILabel()
        label.text = "nxt"
        label.font = UIFont(name: "Mont-HeavyDEMO", size: 70)
        label.textColor = Colors.nxtOrange
        return label
    }()
    
    let bookLabel: UILabel = {
        let label = UILabel()
        label.text = "Book"
        label.font = UIFont(name: "Mont-HeavyDEMO", size: 70)
        label.textColor = UIColor.white
        return label
    }()
    
    let titleView: UIView = {
        let view = UIView()
        return view
    }()
    
    let descripLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.center
        label.text = "textbooks sold the right way"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Futura-Medium", size: 20)
        label.numberOfLines = 2
        return label
    }()
    
    let welcomeView = WelcomeModal()
    let signupView = SignupModal()
    let loginView = LoginModal()
    
    func setupViews() {
        setupBackground()
        
        view.addSubview(titleView)
        titleView.anchor(view.topAnchor, left: nil, bottom: nil, right: nil, topConstant: 110, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 297, heightConstant: 63.33)
        titleView.anchorCenterXToSuperview()
        
        titleView.addSubview(nxtLabel)
        nxtLabel.anchor(titleView.topAnchor, left: titleView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        nxtLabel.sizeToFit()
        
        titleView.addSubview(bookLabel)
        bookLabel.anchor(nil, left: nxtLabel.rightAnchor, bottom: nxtLabel.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        bookLabel.sizeToFit()
        
        nxtLabel.dropShadow(color: UIColor.black, opacity: 0.2, offSet: CGSize(width: 0, height: 15), radius: 20)
        bookLabel.dropShadow(color: UIColor.black, opacity: 0.2, offSet: CGSize(width: 0, height: 15), radius: 20)
        
        view.addSubview(descripLabel)
        descripLabel.anchor(titleView.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 257, heightConstant: 40)
        descripLabel.anchorCenterXToSuperview()
        
        view.addSubview(welcomeView)
        welcomeView.anchor(nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 250)
        welcomeView.controller = self
        
        view.addSubview(signupView)
        signupView.anchor(nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 300)
        signupView.controller = self
        signupView.alpha = 0
        
        view.addSubview(loginView)
        loginView.anchor(nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 300)
        loginView.controller = self
        loginView.alpha = 0
    }
    
    func animateToSignUp() {
        welcomeView.alpha = 1
        signupView.alpha = 0
        loginView.alpha = 0
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut, animations: {
            self.welcomeView.alpha = 0
        }) { (bool) in
            self.signupView.alpha = 0
            self.loginView.alpha = 0
            UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut, animations: {
                self.signupView.alpha = 1
            }, completion: { (bool) in
                self.welcomeView.alpha = 0
                self.loginView.alpha = 0
            })
        }
    }
    
    func animateToLogin() {
        welcomeView.alpha = 1
        signupView.alpha = 0
        loginView.alpha = 0
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut, animations: {
            self.welcomeView.alpha = 0
        }) { (bool) in
            self.signupView.alpha = 0
            self.loginView.alpha = 0
            UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut, animations: {
                self.loginView.alpha = 1
            }, completion: { (bool) in
                self.welcomeView.alpha = 0
                self.signupView.alpha = 0
            })
        }
    }
    
    func animateBackToIndex() {
        welcomeView.alpha = 0
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut, animations: {
            self.signupView.alpha = 0
            self.loginView.alpha = 0
        }) { (bool) in
            self.welcomeView.alpha = 0
            self.signupView.alpha = 0
            self.loginView.alpha = 0
            UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut, animations: {
                self.welcomeView.alpha = 1
            }, completion: { (bool) in
                self.welcomeView.alpha = 1
                
            })
        }
    }
    
    override func viewDidLayoutSubviews() {
        welcomeView.signUp.gradient.frame = welcomeView.signUp.bounds
        welcomeView.logIn.gradient.frame = welcomeView.logIn.bounds
        
        signupView.createAccount.gradient.frame = signupView.createAccount.bounds
        signupView.venmoAccount.gradient.frame = signupView.venmoAccount.bounds
        
        loginView.loginAccount.gradient.frame = loginView.loginAccount.bounds
        loginView.venmoAccount.gradient.frame = loginView.venmoAccount.bounds
    }

    func setupBackground() {
        var gradientLayer: CAGradientLayer!
        
        gradientLayer = CAGradientLayer()
        
        gradientLayer.startPoint = CGPoint(x: 0.2, y: 0.2)
        gradientLayer.endPoint = CGPoint(x: 0.8, y: 0.8)
        
        gradientLayer.frame = self.view.bounds
        
        gradientLayer.colors = [Colors.nxtGreen.cgColor, Colors.nxtBlue.cgColor]
        
        self.view.layer.addSublayer(gradientLayer)
    }
}
