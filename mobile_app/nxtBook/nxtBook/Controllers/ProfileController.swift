//
//  ProfileController.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 10/23/18.
//  Copyright © 2018 Aatif Jiwani. All rights reserved.
//

import UIKit

class ProfileController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    var indexController: IndexController?
    
    var user: User? {
        didSet {
            firstname.text = user?.firstname
            
            if let url = user?.profilePicture {
                if !url.isEmpty {
                    profileImageView.loadImagesUsingCacheWithURLString(url: url)
                }
            }
        }
    }
    
    let myprofileLabel: UILabel = {
        let label = UILabel()
        label.text = "my profile"
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
        imageView.layer.cornerRadius = 23
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let sellingBackground: BackgroundView = {
        let bg = BackgroundView()
        bg.layer.cornerRadius = 12
        return bg
    }()
    
    let sellingLabel: UILabel = {
        let label = UILabel()
        label.text = "selling"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Futura-Medium", size: 24)
        return label
    }()
    
    let soldBackground: BackgroundView = {
        let bg = BackgroundView()
        bg.layer.cornerRadius = 12
        return bg
    }()
    
    let soldLabel: UILabel = {
        let label = UILabel()
        label.text = "sold"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Futura-Medium", size: 24)
        return label
    }()
    
    let pendingBackground: BackgroundView = {
        let bg = BackgroundView()
        bg.layer.cornerRadius = 12
        return bg
    }()
    
    let pendingLabel: UILabel = {
        let label = UILabel()
        label.text = "pending"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Futura-Medium", size: 24)
        return label
    }()
    
    let boughtBackground: BackgroundView = {
        let bg = BackgroundView()
        bg.layer.cornerRadius = 12
        return bg
    }()
    
    let boughtLabel: UILabel = {
        let label = UILabel()
        label.text = "bought"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Futura-Medium", size: 24)
        return label
    }()
    
    let backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "left-arrow"), for: .normal)
        return button
    }()
    
    let settingsButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "settings"), for: .normal)
        return button
    }()
    
    let sellingCollection : BookCollection = {
        let coll = BookCollection()
        return coll
    }()
    
    let soldCollection = BookCollection()
    
    let pendingCollection = BookCollection()
    
    let boughtCollection = BookCollection()
    
    func setupViews() {
        setupBackground()
        
        view.addSubview(backButton)
        backButton.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 30, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 30, heightConstant: 30)
        backButton.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        
        view.addSubview(myprofileLabel)
        myprofileLabel.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 75, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        myprofileLabel.sizeToFit()
        
        view.addSubview(firstname)
        firstname.anchor(myprofileLabel.bottomAnchor, left: myprofileLabel.leftAnchor, bottom: nil, right: nil, topConstant: 15, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        firstname.sizeToFit()
        
        view.addSubview(profileImageView)
        profileImageView.anchor(nil, left: firstname.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 46, heightConstant: 46)
        profileImageView.centerYAnchor.constraint(equalTo: firstname.centerYAnchor).isActive = true
        
        view.addSubview(settingsButton)
        settingsButton.anchor(nil, left: profileImageView.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 35, heightConstant: 35)
        settingsButton.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor).isActive = true
        settingsButton.addTarget(self, action: #selector(handleSettings), for: .touchUpInside)
        
        view.addSubview(sellingBackground)
        sellingBackground.anchor(profileImageView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 30, leftConstant: 25, bottomConstant: 0, rightConstant: 25, widthConstant: 0, heightConstant: 80)
        
        view.addSubview(sellingLabel)
        sellingLabel.anchor(nil, left: nil, bottom: sellingBackground.topAnchor, right: sellingBackground.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 5, rightConstant: 12, widthConstant: 0, heightConstant: 0)
        sellingLabel.sizeToFit()
        
        view.addSubview(soldBackground)
        soldBackground.anchor(sellingBackground.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 50, leftConstant: 25, bottomConstant: 0, rightConstant: 25, widthConstant: 0, heightConstant: 80)
        
        view.addSubview(soldLabel)
        soldLabel.anchor(nil, left: nil, bottom: soldBackground.topAnchor, right: sellingBackground.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 5, rightConstant: 12, widthConstant: 0, heightConstant: 0)
        soldLabel.sizeToFit()
        
        view.addSubview(pendingBackground)
        pendingBackground.anchor(soldBackground.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 50, leftConstant: 25, bottomConstant: 0, rightConstant: 25, widthConstant: 0, heightConstant: 80)
        
        view.addSubview(pendingLabel)
        pendingLabel.anchor(nil, left: nil, bottom: pendingBackground.topAnchor, right: pendingBackground.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 5, rightConstant: 12, widthConstant: 0, heightConstant: 0)
        pendingLabel.sizeToFit()
        
        view.addSubview(boughtBackground)
        boughtBackground.anchor(pendingBackground.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 50, leftConstant: 25, bottomConstant: 0, rightConstant: 25, widthConstant: 0, heightConstant: 80)
        
        view.addSubview(boughtLabel)
        boughtLabel.anchor(nil, left: nil, bottom: boughtBackground.topAnchor, right: boughtBackground.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 5, rightConstant: 12, widthConstant: 0, heightConstant: 0)
        boughtLabel.sizeToFit()
        
        view.addSubview(sellingCollection)
        sellingCollection.anchor(sellingBackground.topAnchor, left: sellingBackground.leftAnchor, bottom: sellingBackground.bottomAnchor, right: sellingBackground.rightAnchor, topConstant: 10, leftConstant: 15, bottomConstant: 10, rightConstant: 15, widthConstant: 0, heightConstant: 0)
        
        view.addSubview(soldCollection)
        soldCollection.anchor(soldBackground.topAnchor, left: soldBackground.leftAnchor, bottom: soldBackground.bottomAnchor, right: soldBackground.rightAnchor, topConstant: 10, leftConstant: 15, bottomConstant: 10, rightConstant: 15, widthConstant: 0, heightConstant: 0)
        
        view.addSubview(pendingCollection)
        pendingCollection.anchor(pendingBackground.topAnchor, left: pendingBackground.leftAnchor, bottom: pendingBackground.bottomAnchor, right: pendingBackground.rightAnchor, topConstant: 10, leftConstant: 15, bottomConstant: 10, rightConstant: 15, widthConstant: 0, heightConstant: 0)
        
        view.addSubview(boughtCollection)
        boughtCollection.anchor(boughtBackground.topAnchor, left: boughtBackground.leftAnchor, bottom: boughtBackground.bottomAnchor, right: boughtBackground.rightAnchor, topConstant: 10, leftConstant: 15, bottomConstant: 10, rightConstant: 15, widthConstant: 0, heightConstant: 0)
        
        
    }
    
    @objc func handleBack() {
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = kCATransitionFade
        transition.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: false, completion: nil)
    }
    
    @objc func handleSettings() {
        let viewController = EditProfileController()
        viewController.indexController = indexController
        viewController.user = self.user
        viewController.previousController = self
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = kCATransitionFade
        transition.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        
        present(viewController, animated: false)
    }
    
    override func viewDidLayoutSubviews() {
        sellingBackground.gradient.frame = sellingBackground.bounds
        soldBackground.gradient.frame = soldBackground.bounds
        pendingBackground.gradient.frame = pendingBackground.bounds
        boughtBackground.gradient.frame = boughtBackground.bounds
                
        sellingCollection.bounds = sellingCollection.bounds
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

