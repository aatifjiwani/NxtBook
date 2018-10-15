//
//  SellABook.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 10/15/18.
//  Copyright © 2018 Aatif Jiwani. All rights reserved.
//

import UIKit

class SellABook: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let sellBackground: BackgroundView = {
        let view = BackgroundView(frame: CGRect(x: 0, y: 0, width: 500, height: 70))
        view.layer.cornerRadius = 0
        return view
    }()
    
    let sell: UILabel = {
        let label = UILabel()
        label.text = "sell"
        label.font = UIFont(name: "Futura-Medium", size: 36)
        label.textColor = UIColor.white
        return label
    }()
    
    let upload: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont(name: "Futura-Medium", size: 30)
        label.textAlignment = .center
        label.text = "upload photos"
        label.textColor = UIColor.white
        return label
    }()
    
    let information: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont(name: "Futura-Medium", size: 30)
        label.textAlignment = .center
        label.text = "add author, title, isbn"
        label.textColor = UIColor.white
        return label
    }()
    
    let condition: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont(name: "Futura-Medium", size: 24)
        label.textAlignment = .center
        label.text = "condition:"
        label.textColor = UIColor.white
        return label
    }()
    
    let conditionStars = ConditionStars()
    
    let price: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont(name: "Futura-Medium", size: 30)
        label.textAlignment = .center
        label.text = "and price"
        label.textColor = UIColor.white
        return label
    }()
    
    
    func setupViews() {
        addSubview(sellBackground)
        sellBackground.anchorCenterXToSuperview()
        sellBackground.anchor(topAnchor, left: nil, bottom: nil, right: nil, topConstant: 80, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 500, heightConstant: 70)
        
        sellBackground.addSubview(sell)
        sell.anchorCenterSuperview()
        sell.sizeToFit()
        
        addSubview(upload)
        upload.anchorCenterXToSuperview()
        upload.anchor(sellBackground.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 50, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        upload.sizeToFit()
        
        addSubview(information)
        information.anchorCenterXToSuperview()
        information.anchor(upload.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 40, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        information.sizeToFit()
        
        addSubview(condition)
        condition.anchorCenterXToSuperview()
        condition.anchor(information.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 40, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        condition.sizeToFit()
        
        addSubview(conditionStars)
        conditionStars.anchorCenterXToSuperview()
        conditionStars.anchor(condition.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 7, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 110, heightConstant: 18)
        conditionStars.changeStarCount(count: 5)
        
        addSubview(price)
        price.anchorCenterXToSuperview()
        price.anchor(conditionStars.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 40, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        price.sizeToFit()
    }
}
