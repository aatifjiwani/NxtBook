//
//  EditProfileController.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 10/23/18.
//  Copyright © 2018 Aatif Jiwani. All rights reserved.
//

import UIKit

class EditProfileController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    var indexController: IndexController?
    
    var user: User? {
        didSet {
            firstname.text = user?.firstname
        }
    }
    
    let editProfileLabel: UILabel = {
        let label = UILabel()
        label.text = "edit profile"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Futura-Medium", size: 24)
        return label
    }()
    
    let firstname: UILabel = {
        let label = UILabel()
        label.text = "..."
        label.textColor = UIColor.white
        label.font = UIFont(name: "Futura-Medium", size: 36)
        return label
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.white
        imageView.layer.cornerRadius = 63
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "left-arrow"), for: .normal)
        return button
    }()
    
    let changePassBackground: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.nxtOrange
        view.layer.cornerRadius = 28
        view.layer.masksToBounds = true
        return view
    }()
    
    let changePassword: UILabel = {
        let label = UILabel()
        label.text = "change password"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Futura-Medium", size: 24)
        return label
    }()
    
    let creditCardBackground: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.nxtGreen
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        return view
    }()
    
    let creditCard: UILabel = {
        let label = UILabel()
        label.text = "credit card"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Futura-Medium", size: 24)
        return label
    }()
    
    let venmoBackground: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.nxtGreen
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        return view
    }()
    
    let venmo: UILabel = {
        let label = UILabel()
        label.text = "venmo"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Futura-Medium", size: 24)
        return label
    }()
    
    func setupViews() {
        setupBackground()
        
        view.addSubview(backButton)
        backButton.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 30, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 30, heightConstant: 30)
        backButton.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        
        view.addSubview(editProfileLabel)
        editProfileLabel.anchor(view.topAnchor, left: nil, bottom: nil, right: nil, topConstant: 75, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        editProfileLabel.anchorCenterXToSuperview()
        editProfileLabel.sizeToFit()
        
        view.addSubview(profileImageView)
        profileImageView.anchor(editProfileLabel.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 50, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 126, heightConstant: 126)
        profileImageView.anchorCenterXToSuperview()
        
        view.addSubview(firstname)
        firstname.anchor(profileImageView.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 15, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        firstname.anchorCenterXToSuperview()
        firstname.sizeToFit()
        
        view.addSubview(changePassBackground)
        changePassBackground.anchorCenterXToSuperview()
        changePassBackground.anchor(firstname.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 50, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 235, heightConstant: 56)
        
        changePassBackground.addSubview(changePassword)
        changePassword.anchorCenterSuperview()
        changePassword.sizeToFit()
        
        view.addSubview(creditCardBackground)
        creditCardBackground.anchor(changePassBackground.bottomAnchor, left: nil, bottom: nil, right: view.centerXAnchor, topConstant: 25, leftConstant: 0, bottomConstant: 0, rightConstant: 10, widthConstant: 175, heightConstant: 60)
        
        creditCardBackground.addSubview(creditCard)
        creditCard.anchorCenterSuperview()
        creditCard.sizeToFit()
        
        view.addSubview(venmoBackground)
        venmoBackground.anchor(changePassBackground.bottomAnchor, left: view.centerXAnchor, bottom: nil, right: nil, topConstant: 25, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 175, heightConstant: 60)
        venmoBackground.addSubview(venmo)
        venmo.anchorCenterSuperview()
        venmo.sizeToFit()
        
    }
    
    @objc func handleBack() {
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = kCATransitionFade
        transition.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: false, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        
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

