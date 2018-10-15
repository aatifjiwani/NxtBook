//
//  IndexController.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 9/29/18.
//  Copyright © 2018 Aatif Jiwani. All rights reserved.
//

import UIKit

class IndexController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        navigationController?.navigationBar.isHidden = true
        
        for family: String in UIFont.familyNames
        {
            print("\(family)")
            for names: String in UIFont.fontNames(forFamilyName: family)
            {
                print("== \(names)")
            }
        }
        
        
        checkUserLoggedIn()
//        setupViews()
    }
    
    var user: User? {
        didSet {
            if let first = user?.firstname, let last = user?.lastname {
                fullNameLabel.text = "\(first.capitalized) \(last.capitalized)"
                print("user \(first) has logged in")
            }
        }
    }
    
    let titleBar: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.nxtOrange
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()
    
    let nxtLabel: UILabel = {
        let label = UILabel()
        label.text = "nxt"
        label.font = UIFont(name: "Mont-HeavyDEMO", size: 50)
        label.textColor = Colors.nxtOrange
        return label
    }()
    
    let bookLabel: UILabel = {
        let label = UILabel()
        label.text = "Book"
        label.font = UIFont(name: "Mont-HeavyDEMO", size: 50)
        label.textColor = UIColor.white
        return label
    }()
    
    let buyButton: IndexButton = {
        let button = IndexButton(type: .custom)
        button.setTitle("buy books", for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura-Medium", size: 36)
        return button
    }()
    
    let sellButton: IndexButton = {
        let button = IndexButton(type: .custom)
        button.setTitle("sell books", for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura-Medium", size: 36)
        return button
    }()
    
    let profileButton: IndexButton = {
        let button = IndexButton(type: .custom)
        button.setTitle("my profile", for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura-Medium", size: 36)
        return button
    }()
    
    let aboutButton: IndexButton = {
        let button = IndexButton(type: .custom)
        button.setTitle("about", for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura-Medium", size: 36)
        return button
    }()
    
    let search = SearchField()
    
    let searchLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.text = "find a book"
        label.font = UIFont(name: "Futura-Medium", size: 18)
        return label
    }()
    
    let logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Logout", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura-Medium", size: 20)
        return button
    }()
    
    let fullNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.nxtOrange
        label.text = "..."
        label.font = UIFont(name: "Futura-Medium", size: 20)
        return label
    }()
    
    
    func checkUserLoggedIn() {
        if UserDefaults.standard.isLoggedIn() {
            //TO REPLACE:
            setupViews()
            print("already logged in \(UserDefaults.standard.getUser())")
        } else {
            let viewController = LoginSignupController()
            viewController.indexController = self
            let transition = CATransition()
            transition.type = kCATransitionFromBottom
            if let window = UIApplication.shared.keyWindow {
                window.set(rootViewController: viewController, withTransition: transition)
            }
        }
    }
    
    
    func setupViews() {
        setupBackground()
        
        view.addSubview(logoutButton)
        logoutButton.anchor(view.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, topConstant: 25, leftConstant: 0, bottomConstant: 0, rightConstant: 30, widthConstant: 0, heightConstant: 0)
        logoutButton.sizeToFit()
        logoutButton.addTarget(self, action: #selector(handleLogout), for: .touchUpInside)
        
        view.addSubview(fullNameLabel)
        fullNameLabel.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 31, leftConstant: 30, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        fullNameLabel.sizeToFit()
        
        view.addSubview(nxtLabel)
        nxtLabel.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 75, leftConstant: 55, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        nxtLabel.sizeToFit()
        
        view.addSubview(bookLabel)
        bookLabel.anchor(nxtLabel.topAnchor, left: nxtLabel.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        bookLabel.sizeToFit()
        
        view.addSubview(titleBar)
        titleBar.anchor(nxtLabel.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 5, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 325, heightConstant: 15)
        titleBar.anchorCenterXToSuperview()
        
        
        view.addSubview(buyButton)
        buyButton.anchorCenterXToSuperview()
        buyButton.anchor(titleBar.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 40, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 325, heightConstant: 70)
        buyButton.setGradientBackground(startColor: Colors.nxtLightOrange, endColor: Colors.nxtOrange, startX: 0.0, startY: 0.5, endX: 1.0, endY: 0.5)
        
        view.addSubview(sellButton)
        sellButton.anchorCenterXToSuperview()
        sellButton.anchor(buyButton.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 30, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 325, heightConstant: 70)
        sellButton.setGradientBackground(startColor: Colors.nxtLightOrange, endColor: Colors.nxtOrange, startX: 0.0, startY: 0.5, endX: 1.0, endY: 0.5)
        
        view.addSubview(profileButton)
        profileButton.anchorCenterXToSuperview()
        profileButton.anchor(sellButton.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 30, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 325, heightConstant: 70)
        profileButton.setGradientBackground(startColor: Colors.nxtLightOrange, endColor: Colors.nxtOrange, startX: 0.0, startY: 0.5, endX: 1.0, endY: 0.5)
        
        view.addSubview(aboutButton)
        aboutButton.anchorCenterXToSuperview()
        aboutButton.anchor(profileButton.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 30, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 325, heightConstant: 70)
        aboutButton.setGradientBackground(startColor: Colors.nxtLightOrange, endColor: Colors.nxtOrange, startX: 0.0, startY: 0.5, endX: 1.0, endY: 0.5)
        aboutButton.addTarget(self, action: #selector(handleAbout), for: .touchUpInside)
        
        
        view.addSubview(search)
        search.anchorCenterXToSuperview()
        search.anchor(nil, left: nil, bottom: view.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 30, rightConstant: 0, widthConstant: 320, heightConstant: 50)
        
        view.addSubview(searchLabel)
        searchLabel.anchorCenterXToSuperview()
        searchLabel.anchor(nil, left: nil, bottom: search.topAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 20, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        searchLabel.sizeToFit()
        
        
    }
    
    @objc func handleLogout() {
        UserDefaults.standard.setIsLoggedIn(value: false)
        let viewController = LoginSignupController()
        viewController.indexController = self
        let transition = CATransition()
        transition.type = kCATransitionFromBottom
        if let window = UIApplication.shared.keyWindow {
            window.set(rootViewController: viewController, withTransition: transition)
        }

        
    }
    
    @objc func handleAbout() {
        let viewController = AboutController()
        viewController.indexController = self
        let transition = CATransition()
        transition.type = kCATransitionFromBottom
        if let window = UIApplication.shared.keyWindow {
            window.set(rootViewController: viewController, withTransition: transition)
        }
    }
    
    override func viewDidLayoutSubviews() {
        buyButton.gradient.frame = buyButton.bounds
        sellButton.gradient.frame = sellButton.bounds
        profileButton.gradient.frame = profileButton.bounds
        aboutButton.gradient.frame = aboutButton.bounds
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
