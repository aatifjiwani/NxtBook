//
//  AboutBotModal.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 10/10/18.
//  Copyright © 2018 Aatif Jiwani. All rights reserved.
//

import UIKit

class AboutBotModal: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let backgroundBox = GBBackgroundView(frame: CGRect(x: 0, y: 0, width: 350, height: 80))

    
    let FBButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "facebook"), for: .normal)
        return button
    }()
    
    let TWButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "twitter"), for: .normal)
        return button
    }()
    
    let IGButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "instagram"), for: .normal)
        return button
    }()
    
    func setupViews() {
        addSubview(backgroundBox)
        backgroundBox.anchorCenterXToSuperview()
        backgroundBox.anchor(topAnchor, left: nil, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 350, heightConstant: 80)
        
        addSubview(FBButton)
        FBButton.anchor(backgroundBox.topAnchor, left: backgroundBox.leftAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 60)
        
        addSubview(IGButton)
        IGButton.anchorCenterXToSuperview()
        IGButton.anchor(backgroundBox.topAnchor, left: nil, bottom: nil, right: nil, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 60)
        
        addSubview(TWButton)
        TWButton.anchor(backgroundBox.topAnchor, left: nil, bottom: nil, right: backgroundBox.rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 20, widthConstant: 60, heightConstant: 60)
        
    }
}

