//
//  MarkAsComplete.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 10/15/18.
//  Copyright © 2018 Aatif Jiwani. All rights reserved.
//

import UIKit

class MarkAsComplete: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let pickUpLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont(name: "Futura-Medium", size: 30)
        label.textAlignment = .center
        label.text = "once you pick up the book"
        label.textColor = UIColor.white
        return label
    }()
    
    let markAsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont(name: "Futura-Medium", size: 20)
        label.textAlignment = .center
        label.text = "mark purchase as complete"
        label.textColor = UIColor.white
        return label
    }()
    
    let completeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 5
        label.font = UIFont(name: "Futura-Medium", size: 30)
        label.textAlignment = .center
        label.text = "complete the purchase and the payment will go through"
        label.textColor = UIColor.white
        return label
    }()
    
    let backgroundView: BackgroundView = {
        let view = BackgroundView(frame: CGRect(x: 0, y: 0, width: 250, height: 140))
        view.gradient.startPoint = CGPoint(x: 0.5 , y: 0.3)
        view.gradient.endPoint = CGPoint(x: 0.5, y: 0.7)
        return view
    }()
    
    let yesButton: BuyBookButton = {
        let button = BuyBookButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 80, height: 30)
        button.setTitle("yes", for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura-Medium", size: 18)
        return button
    }()
    
    let noButton: BuyBookButton = {
        let button = BuyBookButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 80, height: 30)
        button.setTitle("no", for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura-Medium", size: 18)
        return button
    }()
    
    func setupViews() {
        
        addSubview(pickUpLabel)
        pickUpLabel.anchorCenterXToSuperview()
        pickUpLabel.anchor(topAnchor, left: nil, bottom: nil, right: nil, topConstant: 90, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 300, heightConstant: 125)
        
        addSubview(backgroundView)
        backgroundView.anchorCenterXToSuperview()
        backgroundView.anchor(pickUpLabel.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 250, heightConstant: 140)
        
        addSubview(markAsLabel)
        markAsLabel.anchorCenterXToSuperview()
        markAsLabel.anchor(backgroundView.topAnchor, left: backgroundView.leftAnchor, bottom: nil, right: backgroundView.rightAnchor, topConstant: 5, leftConstant: 30, bottomConstant: 0, rightConstant: 30, widthConstant: 0, heightConstant: 70)
        
        addSubview(yesButton)
        yesButton.anchor(markAsLabel.bottomAnchor, left: nil, bottom: nil, right: centerXAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 10, widthConstant: 80, heightConstant: 30)
        
        addSubview(noButton)
        noButton.anchor(yesButton.topAnchor, left: centerXAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 80, heightConstant: 30)
        
        addSubview(completeLabel)
        completeLabel.anchorCenterXToSuperview()
        completeLabel.anchor(backgroundView.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 300, heightConstant: 275)
        
        
    }
}
