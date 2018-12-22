//
//  DynamicBookModal.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 10/11/18.
//  Copyright © 2018 Aatif Jiwani. All rights reserved.
//

import UIKit

class DynamicBookModal: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var book: Book? {
        didSet {
            
        }
    }
    
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.nxtOrange
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Fundamentals of Accounting"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Futura-Medium", size: 24)
        return label
    }()
    
    let coverPhoto: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        return view
    }()
    
    let author: UILabel = {
        let label = UILabel()
        label.text = "author:"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Futura-Bold", size: 18)
        return label
    }()
    
    let authorLabel: UILabel = {
        let label = UILabel()
        label.text = "Aatif Jiwani"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Futura-Medium", size: 18)
        return label
    }()
    
    let edition: UILabel = {
        let label = UILabel()
        label.text = "edition:"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Futura-Bold", size: 18)
        return label
    }()
    
    let editionLabel: UILabel = {
        let label = UILabel()
        label.text = "4th"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Futura-Medium", size: 18)
        return label
    }()
    
    let isbn: UILabel = {
        let label = UILabel()
        label.text = "isbn:"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Futura-Bold", size: 18)
        return label
    }()
    
    let isbnLabel: UILabel = {
        let label = UILabel()
        label.text = "1234567890987"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Futura-Medium", size: 18)
        return label
    }()
    
    let conditionLabel: UILabel = {
        let label = UILabel()
        label.text = "condition: "
        label.textColor = UIColor.white
        label.font = UIFont(name: "Futura-Bold", size: 18)
        return label
    }()
    
    let condition = ConditionStars()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "$35.00"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Futura-Bold", size: 30)
        return label
    }()
    
    let buyBook: BuyBookButton = {
        let button = BuyBookButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 170, height: 40)
        button.setTitle("buy now", for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura-Medium", size: 24)
        return button
    }()
    
    func setupViews() {
        addSubview(backgroundView)
        backgroundView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        addSubview(titleLabel)
        titleLabel.anchorCenterXToSuperview()
        titleLabel.anchor(topAnchor, left: nil, bottom: nil, right: nil, topConstant: 15, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        titleLabel.sizeToFit()
        
        addSubview(coverPhoto)
        coverPhoto.anchor(titleLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 15, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 140, heightConstant: 200)
        
        addSubview(author)
        author.anchor(coverPhoto.topAnchor, left: coverPhoto.rightAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 24)
        
        addSubview(authorLabel)
        authorLabel.anchor(author.bottomAnchor, left: author.leftAnchor, bottom: nil, right: author.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 24)
        
        addSubview(edition)
        edition.anchor(authorLabel.bottomAnchor, left: author.leftAnchor, bottom: nil, right: author.rightAnchor, topConstant: 3, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 24)
        
        addSubview(editionLabel)
        editionLabel.anchor(edition.bottomAnchor, left: author.leftAnchor, bottom: nil, right: author.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 24)
        
        addSubview(isbn)
        isbn.anchor(editionLabel.bottomAnchor, left: author.leftAnchor, bottom: nil, right: author.rightAnchor, topConstant: 3, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 24)
        
        addSubview(isbnLabel)
        isbnLabel.anchor(isbn.bottomAnchor, left: author.leftAnchor, bottom: nil, right: author.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 24)
        
        addSubview(conditionLabel)
        conditionLabel.anchor(isbnLabel.bottomAnchor, left: author.leftAnchor, bottom: nil, right: nil, topConstant: 3, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 24)
        conditionLabel.sizeToFit()
        
        addSubview(condition)
        condition.anchor(nil, left: conditionLabel.rightAnchor, bottom: nil, right: author.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 18)
        condition.centerYAnchor.constraint(equalTo: conditionLabel.centerYAnchor).isActive = true
        condition.changeStarCount(count: 4)
        
        addSubview(priceLabel)
        priceLabel.anchor(coverPhoto.bottomAnchor, left: coverPhoto.leftAnchor, bottom: nil, right: nil, topConstant: 15, leftConstant: 35, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        priceLabel.sizeToFit()
        
        addSubview(buyBook)
        buyBook.anchor(nil, left: priceLabel.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 15, bottomConstant: 0, rightConstant: 0, widthConstant: 170, heightConstant: 40)
        buyBook.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor).isActive = true
    }
}
