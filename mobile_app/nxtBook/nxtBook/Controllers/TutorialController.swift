//
//  TutorialController.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 10/10/18.
//  Copyright © 2018 Aatif Jiwani. All rights reserved.
//

import UIKit

class TutorialController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    let welcomeModal = Welcome()
    
    let buyAndSellModal = BuyAndSell()
    
    let searchModal = Search()
    
    func setupViews() {
        setupBackground()
//        view.addSubview(welcomeModal)
//        welcomeModal.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
//        view.addSubview(buyAndSellModal)
//        buyAndSellModal.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        view.addSubview(searchModal)
        searchModal.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        view.isUserInteractionEnabled = true
        view.isMultipleTouchEnabled = true
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleContinueTut))
        view.addGestureRecognizer(gesture)
    }
    
    var user: User?
    
    @objc func handleContinueTut() {
        print("whoa")
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
