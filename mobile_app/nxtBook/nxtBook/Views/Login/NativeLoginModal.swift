//
//  NativeLoginModal.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 10/3/18.
//  Copyright © 2018 Aatif Jiwani. All rights reserved.
//

import UIKit

class NativeLoginModal: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var controller: LoginController?
    
    let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "login"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Futura-Medium", size: 24)
        return label
    }()
    
    let backgroundBox = BackgroundView(frame: CGRect(x: 0, y: 0, width: 350, height: 200))
    
    let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("back", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura-Medium", size: 18)
        return button
    }()
    
    func setupViews() {
        addSubview(loginLabel)
        loginLabel.anchor(topAnchor, left: nil, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        loginLabel.anchorCenterXToSuperview()
        loginLabel.sizeToFit()
        
        addSubview(backgroundBox)
        backgroundBox.anchorCenterXToSuperview()
        backgroundBox.anchor(loginLabel.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 350, heightConstant: 200)
        
        addSubview(backButton)
        backButton.anchorCenterXToSuperview()
        backButton.anchor(backgroundBox.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        backButton.sizeToFit()
        backButton.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
    }
    
    @objc func handleBack() {
        controller?.handleBack()
    }
}
