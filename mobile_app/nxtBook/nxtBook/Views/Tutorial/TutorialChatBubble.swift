//
//  TutorialChatBubble.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 10/11/18.
//  Copyright © 2018 Aatif Jiwani. All rights reserved.
//

import UIKit

class TutorialChatBubble: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let message: UILabel = {
        let label = UILabel()
        label.text = "."
        label.textColor = UIColor.white
        label.font = UIFont(name: "Futura-Medium", size: 14)
        label.numberOfLines = 10
        return label
    }()
    
    func setupViews() {
        backgroundColor = Colors.messageBlue
        layer.cornerRadius = 30
        layer.masksToBounds = true
        
        addSubview(message)
        message.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 10, leftConstant: 25, bottomConstant: 10, rightConstant: 25, widthConstant: 0, heightConstant: 0)
        
    }
}
