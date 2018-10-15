//
//  Welcome.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 10/10/18.
//  Copyright © 2018 Aatif Jiwani. All rights reserved.
//

import UIKit

class Welcome: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var firstName = "Demo"
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont(name: "Futura-Medium", size: 38)
        label.textAlignment = .center
        label.text = "."
        label.textColor = UIColor.white
        return label
    }()
    
    
    func changeWelcomeString(first: String) {
        welcomeLabel.text = "welcome to nxtBook, \(first)!"
    }
    
    func setupViews() {
        let welcomeString = "welcome to nxtBook, \(firstName)!"
        welcomeLabel.text = welcomeString
        
        addSubview(welcomeLabel)
        welcomeLabel.anchorCenterSuperview()
        welcomeLabel.anchor(nil, left: nil, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 350, heightConstant: 125)
    }
}
