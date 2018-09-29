//
//  IndexButton.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 9/29/18.
//  Copyright © 2018 Aatif Jiwani. All rights reserved.
//

import UIKit

class IndexButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let gradient: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [Colors.nxtLightOrange.cgColor, Colors.nxtOrange.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.3 , y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.7, y: 0.5)
        return gradientLayer
    }()
    
    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 4.0
        
        layer.cornerRadius = 8
        layer.masksToBounds = true

        contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        
        
        setTitleColor(UIColor.white, for: .normal)
        
        gradient.frame = bounds
        layer.addSublayer(gradient)
    }
}
