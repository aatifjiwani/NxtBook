//
//  AboutController.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 10/10/18.
//  Copyright © 2018 Aatif Jiwani. All rights reserved.
//

import UIKit

class AboutController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    var indexController: IndexController?
    
    let topModal = AboutTopModal()
    
    let botModal = AboutBotModal()
    
    let aboutLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.text = "about"
        label.font = UIFont(name: "Futura-Medium", size: 36)
        return label
    }()
    
    let followLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.text = "follow us!"
        label.font = UIFont(name: "Futura-Medium", size: 36)
        return label
    }()
    
    let backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "left-arrow"), for: .normal)
        return button
    }()
    
    func setupViews() {
        setupBackground()
        
        view.addSubview(backButton)
        backButton.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 30, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 30, heightConstant: 30)
        backButton.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        
        view.addSubview(aboutLabel)
        aboutLabel.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 75, leftConstant: 40, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        aboutLabel.sizeToFit()
        
        view.addSubview(topModal)
        topModal.anchor(aboutLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 310)
        
        view.addSubview(followLabel)
        followLabel.anchor(topModal.bottomAnchor, left: aboutLabel.leftAnchor, bottom: nil, right: nil, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        followLabel.sizeToFit()
        
        view.addSubview(botModal)
        botModal.anchor(followLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 80)
    }
    
    @objc func handleBack() {
        if indexController != nil {
            let viewController = indexController
            let transition = CATransition()
            transition.type = kCATransitionFromBottom
            if let window = UIApplication.shared.keyWindow {
                window.set(rootViewController: viewController!, withTransition: transition)
            }
        }
    }

    override func viewDidLayoutSubviews() {
        topModal.backgroundBox.gradient.frame = topModal.backgroundBox.bounds
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
