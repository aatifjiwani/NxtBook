//
//  SellBookModal.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 11/13/18.
//  Copyright © 2018 Aatif Jiwani. All rights reserved.
//

import UIKit

class SellBookModal: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    var controller: SellBookController?
    
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
    
    let titleField: CredentialField = {
        let field = CredentialField()
        field.font = UIFont(name: "Futura-Medium", size: 24)
        field.textAlignment = .center
        return field
    }()
    
    let coverPhoto: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "addcoverphoto")
        view.contentMode = .scaleAspectFit
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        return view
    }()
    
    let coverLabel: UILabel = {
        let label = UILabel()
        label.text = "cover photo"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Futura-Medium", size: 16)
        return label
    }()
    
    let author: UILabel = {
        let label = UILabel()
        label.text = "author:"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Futura-Bold", size: 18)
        return label
    }()
    
    let authorField: CredentialField = {
        let field = CredentialField()
        field.font = UIFont(name: "Futura-Medium", size: 18)
        return field
    }()
    
    let edition: UILabel = {
        let label = UILabel()
        label.text = "edition:"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Futura-Bold", size: 18)
        return label
    }()
    
    let editionField: CredentialField = {
        let field = CredentialField()
        field.font = UIFont(name: "Futura-Medium", size: 18)
        return field
    }()
    
    let isbn: UILabel = {
        let label = UILabel()
        label.text = "isbn:"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Futura-Bold", size: 18)
        return label
    }()
    
    let isbnField: CredentialField = {
        let field = CredentialField()
        field.font = UIFont(name: "Futura-Medium", size: 18)
        return field
    }()
    
    let conditionLabel: UILabel = {
        let label = UILabel()
        label.text = "condition: "
        label.textColor = UIColor.white
        label.font = UIFont(name: "Futura-Bold", size: 18)
        return label
    }()
    
    let condition = ConditionStars(frame: .zero, height: 22)
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "price: "
        label.textColor = UIColor.white
        label.font = UIFont(name: "Futura-Bold", size: 18)
        return label
    }()
    
    let priceField: CredentialField = {
        let field = CredentialField()
        field.font = UIFont(name: "Futura-Medium", size: 18)
        return field
    }()
    
    let sellBook: BuyBookButton = {
        let button = BuyBookButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 170, height: 40)
        button.setTitle("sell now", for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura-Medium", size: 24)
        return button
    }()
    
    @objc func changeCoverPhoto() {
        guard controller != nil else {
            return
        }
        
        controller?.changeCoverPhoto()
    }
    
    func setupViews() {
        addSubview(backgroundView)
        backgroundView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        addSubview(titleField)
        titleField.anchorCenterXToSuperview()
        titleField.anchor(topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 15, leftConstant: 20, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 36)
        
        addSubview(coverPhoto)
        coverPhoto.anchor(titleField.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 15, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 140, heightConstant: 200)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(changeCoverPhoto))
        coverPhoto.addGestureRecognizer(gesture)
        coverPhoto.isUserInteractionEnabled = true
        coverPhoto.isMultipleTouchEnabled = true
        
        
        addSubview(coverLabel)
        coverLabel.anchor(coverPhoto.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 5, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        coverLabel.sizeToFit()
        coverLabel.centerXAnchor.constraint(equalTo: coverPhoto.centerXAnchor).isActive = true
        
        
        addSubview(author)
        author.anchor(coverPhoto.topAnchor, left: coverPhoto.rightAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 24)
        
        addSubview(authorField)
        authorField.anchor(author.bottomAnchor, left: author.leftAnchor, bottom: nil, right: author.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 30)
        
        addSubview(edition)
        edition.anchor(authorField.bottomAnchor, left: author.leftAnchor, bottom: nil, right: author.rightAnchor, topConstant: 8, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 24)
        
        addSubview(editionField)
        editionField.anchor(edition.bottomAnchor, left: author.leftAnchor, bottom: nil, right: author.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 30, widthConstant: 0, heightConstant: 30)
        
        addSubview(isbn)
        isbn.anchor(editionField.bottomAnchor, left: author.leftAnchor, bottom: nil, right: author.rightAnchor, topConstant: 8, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 24)
        
        addSubview(isbnField)
        isbnField.anchor(isbn.bottomAnchor, left: author.leftAnchor, bottom: nil, right: author.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 30)
        
        addSubview(priceLabel)
        priceLabel.anchor(isbnField.bottomAnchor, left: author.leftAnchor, bottom: nil, right: author.rightAnchor, topConstant: 8, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 24)
        
        addSubview(priceField)
        priceField.anchor(priceLabel.bottomAnchor, left: author.leftAnchor, bottom: nil, right: author.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 30)
        
        addSubview(conditionLabel)
        conditionLabel.anchor(priceField.bottomAnchor, left: author.leftAnchor, bottom: nil, right: nil, topConstant: 8, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 24)
        conditionLabel.sizeToFit()
        
        addSubview(condition)
        condition.anchor(conditionLabel.bottomAnchor, left: conditionLabel.leftAnchor, bottom: nil, right: author.rightAnchor, topConstant: 2, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 22)
        condition.changeStarCount(count: 0)
        
        
        addSubview(sellBook)
        sellBook.anchorCenterXToSuperview()
        sellBook.anchor(nil, left: nil, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 20, rightConstant: 0, widthConstant: 170, heightConstant: 40)
//        addSubview(buyBook)
//        buyBook.anchor(nil, left: priceLabel.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 15, bottomConstant: 0, rightConstant: 0, widthConstant: 170, heightConstant: 40)
//        buyBook.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor).isActive = true
    }
}
