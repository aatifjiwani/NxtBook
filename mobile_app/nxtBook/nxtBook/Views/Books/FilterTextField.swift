//
//  FilterTextField.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 1/19/19.
//  Copyright © 2019 Aatif Jiwani. All rights reserved.
//

import UIKit

class FilterTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let padding = UIEdgeInsets(top: 0, left: 60, bottom: 0, right: 5);
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5))
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    let searchIcon: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 10, y: 0, width: 25, height: 25))
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "search")
        return view
    }()
    
    func setupViews() {
        backgroundColor = UIColor.white
        layer.masksToBounds = true
        layer.cornerRadius = 25
        
        leftViewMode = UITextFieldViewMode.always
        leftViewMode = .always
        
        textAlignment = .left
        
        let centeredParagraphStyle = NSMutableParagraphStyle()
        centeredParagraphStyle.alignment = .center
        
//        attributedPlaceholder = NSAttributedString(string: "title, author, isbn",
//                                                   attributes: [NSAttributedStringKey.foregroundColor: Colors.nxtBlue, NSAttributedStringKey.font: UIFont(name: "Futura-Medium", size: 20)!, NSAttributedStringKey.paragraphStyle: centeredParagraphStyle])
        
        let iconView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        iconView.addSubview(searchIcon)
        searchIcon.anchorCenterYToSuperview()
        searchIcon.anchor(nil, left: iconView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 25, heightConstant: 25)
        
        textColor = Colors.nxtBlue
        font = UIFont(name: "Futura-Medium", size: 20)
        
        leftView = iconView
    }
}
