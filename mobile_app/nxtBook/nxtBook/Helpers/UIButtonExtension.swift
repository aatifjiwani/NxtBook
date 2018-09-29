//
//  UIButtonExtension.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 9/29/18.
//  Copyright © 2018 Aatif Jiwani. All rights reserved.
//

import UIKit

extension UIButton
{
    func setGradientBackground(startColor: UIColor, endColor: UIColor, startX: CGFloat, startY: CGFloat, endX: CGFloat, endY: CGFloat) {
        

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: startX, y: startY)
        gradientLayer.endPoint = CGPoint(x: endX, y: endY)
        gradientLayer.frame = self.bounds
        self.layer.addSublayer(gradientLayer)
    }
}
