//
//  BuyAndSell.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 10/10/18.
//  Copyright © 2018 Aatif Jiwani. All rights reserved.
//

import UIKit

class BuyAndSell: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let buyBackground = BackgroundView(frame: CGRect(x: 0, y: 0, width: 350, height: 70))
    
    let sellBackground: BackgroundView = {
        let view = BackgroundView(frame: CGRect(x: 0, y: 0, width: 350, height: 70))
        view.gradient.colors = [Colors.nxtOrange.cgColor, Colors.nxtLightOrange.cgColor]
        return view
    }()
    
    let ampersand: UILabel = {
        let label = UILabel()
        label.text = "&"
        label.font = UIFont(name: "Futura-Medium", size: 48)
        label.textColor = UIColor.white
        return label
    }()
    
    let buy: UILabel = {
        let label = UILabel()
        label.text = "buy"
        label.font = UIFont(name: "Futura-Medium", size: 36)
        label.textColor = UIColor.white
        return label
    }()
    
    let sell: UILabel = {
        let label = UILabel()
        label.text = "sell"
        label.font = UIFont(name: "Futura-Medium", size: 36)
        label.textColor = UIColor.white
        return label
    }()
    
    let textBook: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont(name: "Futura-Medium", size: 38)
        label.textAlignment = .center
        label.text = "textbooks for the best prices"
        label.textColor = UIColor.white
        return label
    }()

    
    
    
    func setupViews() {
        addSubview(buyBackground)
        buyBackground.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 80, leftConstant: -10, bottomConstant: 0, rightConstant: 0, widthConstant: 350, heightConstant: 70)
    
        
        addSubview(ampersand)
        ampersand.anchorCenterXToSuperview()
        ampersand.anchor(buyBackground.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        ampersand.sizeToFit()
        
        addSubview(sellBackground)
        sellBackground.anchor(ampersand.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: -10, widthConstant: 350, heightConstant: 70)
        
        buyBackground.addSubview(buy)
        buy.anchorCenterYToSuperview()
        buy.centerXAnchor.constraint(equalTo: ampersand.centerXAnchor).isActive = true
        buy.sizeToFit()
        
        sellBackground.addSubview(sell)
        sell.anchorCenterYToSuperview()
        sell.centerXAnchor.constraint(equalTo: ampersand.centerXAnchor).isActive = true
        sell.sizeToFit()
        
        addSubview(textBook)
        textBook.anchorCenterXToSuperview()
        textBook.anchor(sellBackground.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 80, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 300, heightConstant: 100)
    }
}
