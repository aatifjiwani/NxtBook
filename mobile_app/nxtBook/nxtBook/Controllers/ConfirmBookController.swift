//
//  ConfirmBookController.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 1/16/19.
//  Copyright © 2019 Aatif Jiwani. All rights reserved.
//

import UIKit

class ConfirmBookController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var indexController: IndexController?
    
    var prevController: UIViewController?
    var typeConfirm: Int? {
        didSet {
            setupViews()
            
            if typeConfirm != 0 {
                dismissToPrevView.setTitle("find another book", for: .normal)
                goToNewController.setTitle("chat with seller", for: .normal)
            }
        }
    }
    
    var user: User?
    
    
    let bgView = BackgroundView()
    
    let goHomeButton: BuyBookButton = {
        let button = BuyBookButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: 175, height: 40)
        button.setTitle("go back home", for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura-Medium", size: 24)
        return button
    }()
    
    let congrats : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Futura-Medium", size: 36)
        label.textAlignment = .center
        label.text = "congrats!"
        label.textColor = UIColor.white
        return label
    }()
    
    let liveListing : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Futura-Medium", size: 24)
        label.textAlignment = .center
        label.text = "your listing is live."
        label.textColor = UIColor.white
        return label
    }()
    
    let securedABook : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Futura-Medium", size: 24)
        label.textAlignment = .center
        label.text = "you've secured a book."
        label.textColor = UIColor.white
        return label
    }()
    
    let goToNewController: BuyBookButton = {
        let button = BuyBookButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 65)
        button.setTitle("view profile", for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura-Medium", size: 24)
        return button
    }()
    
    let dismissToPrevView: BuyBookButton = {
        let button = BuyBookButton(type: .custom)
        button.gradient.colors = [Colors.nxtOrange.cgColor, Colors.nxtLightOrange.cgColor]
        button.frame = CGRect(x: 0, y: 0, width: 300, height: 65)
        button.setTitle("sell another book", for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura-Medium", size: 24)
        return button
    }()
    
    func setupViews() {
        setupBackground()
        
        view.addSubview(bgView)
        bgView.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 100, leftConstant: 20, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 250)
        
        view.addSubview(congrats)
        congrats.anchor(bgView.topAnchor, left: nil, bottom: nil, right: nil, topConstant: 25, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        congrats.anchorCenterXToSuperview()
        congrats.sizeToFit()
        
        if typeConfirm == 0 {
            view.addSubview(liveListing)
            liveListing.anchor(congrats.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
            liveListing.anchorCenterXToSuperview()
            liveListing.sizeToFit()
        } else {
            view.addSubview(securedABook)
            securedABook.anchor(congrats.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
            securedABook.anchorCenterXToSuperview()
            securedABook.sizeToFit()
        }
        
        view.addSubview(goToNewController)
        goToNewController.anchor(nil, left: nil, bottom: bgView.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 20, rightConstant: 0, widthConstant: 200, heightConstant: 65)
        goToNewController.anchorCenterXToSuperview()
        goToNewController.addTarget(self, action: #selector(handleGoToController), for: .touchUpInside)
        
        view.addSubview(dismissToPrevView)
        dismissToPrevView.anchor(bgView.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 25, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 300, heightConstant: 65)
        dismissToPrevView.anchorCenterXToSuperview()
        dismissToPrevView.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
        
        view.addSubview(goHomeButton)
        goHomeButton.anchor(dismissToPrevView.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 175, heightConstant: 40)
        goHomeButton.anchorCenterXToSuperview()
        goHomeButton.addTarget(self, action: #selector(handleGoToHome), for: .touchUpInside)
        
        
    }
    
    override func viewDidLayoutSubviews() {
        print(bgView.bounds)
        
        bgView.gradient.frame = bgView.bounds
        goToNewController.gradient.frame = goToNewController.bounds
        dismissToPrevView.gradient.frame = dismissToPrevView.bounds
        
        if typeConfirm == 0 {
            
        } else {
            
        }
    }
    
    @objc func handleDismiss() {
        print("hello")
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = kCATransitionFade
        transition.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: false, completion: nil)
    }
    
    @objc func handleGoToController() {
        
        if typeConfirm == 0 {
            let viewController = ProfileController()
            viewController.indexController = indexController
            viewController.user = self.user
            
            let transition = CATransition()
            transition.duration = 0.5
            transition.type = kCATransitionFade
            transition.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
            view.window!.layer.add(transition, forKey: kCATransition)
            
            present(viewController, animated: false)
        } else {
            
        }
        
        
    }
    
    @objc func handleGoToHome() {
        if indexController != nil {
            let transition = CATransition()
            transition.duration = 0.5
            transition.type = kCATransitionFade
            transition.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
            view.window!.layer.add(transition, forKey: kCATransition)
            
            indexController?.dismiss(animated: false, completion: nil)
        }
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
