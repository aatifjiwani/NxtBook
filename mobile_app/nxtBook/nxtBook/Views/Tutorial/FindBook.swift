//
//  FindBook.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 10/11/18.
//  Copyright © 2018 Aatif Jiwani. All rights reserved.
//

import UIKit

class FindBook: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        label.text = "fundamentals of accounting"
        label.font = UIFont(name: "Futura-Medium", size: 20)
        label.textColor = Colors.nxtBlue
        return label
    }()
    
    let bookView = ShowBookModal()
    
    let textBook: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.font = UIFont(name: "Futura-Medium", size: 38)
        label.textAlignment = .center
        label.text = "find the book you want, then click buy now."
        label.textColor = UIColor.white
        return label
    }()
    
    func setupViews() {
        addSubview(searchView)
        searchView.anchor(topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 60, leftConstant: 30, bottomConstant: 0, rightConstant: 30, widthConstant: 0, heightConstant: 50)
        
        searchView.addSubview(searchIcon)
        searchIcon.anchor(nil, left: searchView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 15, bottomConstant: 0, rightConstant: 0, widthConstant: 30, heightConstant: 30)
        searchIcon.anchorCenterYToSuperview()
        
        searchView.addSubview(placeholder)
        placeholder.anchorCenterSuperview()
        
        addSubview(bookView)
        bookView.anchor(searchView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 40, leftConstant: 10, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 360)
        
        addSubview(textBook)
        textBook.anchor(bookView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 15, leftConstant: 20, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 160)
    }
}
