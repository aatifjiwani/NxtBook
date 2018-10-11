//
//  Search.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 10/10/18.
//  Copyright © 2018 Aatif Jiwani. All rights reserved.
//

import UIKit

class Search: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let buyBackground: BackgroundView = {
        let view = BackgroundView(frame: CGRect(x: 0, y: 0, width: 500, height: 70))
        view.layer.cornerRadius = 0
        return view
    }()
    
    let buy: UILabel = {
        let label = UILabel()
        label.text = "buy"
        label.font = UIFont(name: "Futura-Medium", size: 36)
        label.textColor = UIColor.white
        return label
    }()
    
    let searchBy: UILabel = {
        let label = UILabel()
        label.text = "search by"
        label.font = UIFont(name: "Futura-Medium", size: 36)
        label.textColor = UIColor.white
        return label
    }()
    
    let searchView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 25
        view.layer.masksToBounds = true
        return view
    }()
    
    let searchIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "search")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let placeholder: UILabel = {
        let label = UILabel()
        label.text = "title, isbn, author"
        label.font = UIFont(name: "Futura-Medium", size: 20)
        label.textColor = Colors.nxtBlue
        return label
    }()
    
    func setupViews() {
        addSubview(buyBackground)
        buyBackground.anchorCenterXToSuperview()
        buyBackground.anchor(topAnchor, left: nil, bottom: nil, right: nil, topConstant: 80, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 500, heightConstant: 70)
        
        buyBackground.addSubview(buy)
        buy.anchorCenterSuperview()
        buy.sizeToFit()
        
        addSubview(searchBy)
        searchBy.anchorCenterXToSuperview()
        searchBy.anchor(buyBackground.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 90, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        searchBy.sizeToFit()
        
        addSubview(searchView)
        searchView.anchor(searchBy.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 20, leftConstant: 30, bottomConstant: 0, rightConstant: 30, widthConstant: 0, heightConstant: 50)
        
        searchView.addSubview(searchIcon)
        searchIcon.anchor(nil, left: searchView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 15, bottomConstant: 0, rightConstant: 0, widthConstant: 30, heightConstant: 30)
        searchIcon.anchorCenterYToSuperview()
        
        searchView.addSubview(placeholder)
        placeholder.anchorCenterSuperview()

    }
}
