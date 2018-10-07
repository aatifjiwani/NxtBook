//
//  SignupController.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 10/6/18.
//  Copyright © 2018 Aatif Jiwani. All rights reserved.
//

import UIKit

class SignupController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        setupViews()
    }
    
    var indexController: IndexController?
    
    let signupModal = NativeSignupModal()
    
    func setupViews() {
        setupBackground()
        
        view.addSubview(signupModal)
        signupModal.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 100, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 300)
        signupModal.controller = self
        signupModal.indexController = indexController
    }
    
    override func viewDidLayoutSubviews() {
        signupModal.backgroundBox.gradient.frame = signupModal.backgroundBox.bounds
    }
    
    func handleBack() {
        dismiss(animated: true, completion: nil)
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
