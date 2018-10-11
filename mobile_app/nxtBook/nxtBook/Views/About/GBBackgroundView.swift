//
//  GBBackgroundView.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 10/10/18.
//  Copyright © 2018 Aatif Jiwani. All rights reserved.
//

import UIKit

class GBBackgroundView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let gradient: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [Colors.nxtBlue.cgColor, Colors.nxtGreen.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.3 , y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.7, y: 0.5)
        return gradientLayer
    }()
    
    func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 8
        clipsToBounds = true
        
        gradient.frame = bounds
        layer.addSublayer(gradient)
    }
}

