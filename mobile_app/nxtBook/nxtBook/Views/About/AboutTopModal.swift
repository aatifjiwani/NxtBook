//
//  AboutTopModal.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 10/10/18.
//  Copyright © 2018 Aatif Jiwani. All rights reserved.
//

import UIKit

class AboutTopModal: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let backgroundBox = BackgroundView(frame: CGRect(x: 0, y: 0, width: 350, height: 300))
    
    var aboutString = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
    
    let aboutLabel: UILabel = {
        let label = UILabel()
        label.text = "."
        label.textColor = UIColor.white
        label.numberOfLines = 10
        label.font = UIFont(name: "Futura-Medium", size: 18)
        label.textAlignment = .center
        return label
    }()
    
    func setupViews() {
        addSubview(backgroundBox)
        backgroundBox.anchorCenterXToSuperview()
        backgroundBox.anchor(topAnchor, left: nil, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 350, heightConstant: 300)
        
        aboutLabel.text = aboutString
        
        addSubview(aboutLabel)
        aboutLabel.anchor(backgroundBox.topAnchor, left: backgroundBox.leftAnchor, bottom: backgroundBox.bottomAnchor, right: backgroundBox.rightAnchor, topConstant: 10, leftConstant: 10, bottomConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 0)
        
    }
}
