//
//  BookFilterModal.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 1/19/19.
//  Copyright © 2019 Aatif Jiwani. All rights reserved.
//

import UIKit

class BookFilterModal: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var controller: BuyBookController?
    
    let filterIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "filter-button")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let searchCriteriaLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Futura-Medium", size: 36)
        label.textAlignment = .center
        label.text = "search criteria"
        label.textColor = UIColor.white
        return label
    }()
    
    func setupViews() {
        backgroundColor = Colors.nxtBlue
        layer.cornerRadius = 8
        layer.masksToBounds = true
        
        addSubview(filterIcon)
        filterIcon.anchor(topAnchor, left: nil, bottom: nil, right: nil, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 35, heightConstant: 35)
        filterIcon.anchorCenterXToSuperview()
        
        addSubview(searchCriteriaLabel)
        searchCriteriaLabel.anchor(filterIcon.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 7, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        searchCriteriaLabel.anchorCenterXToSuperview()
        searchCriteriaLabel.sizeToFit()
    }
}
