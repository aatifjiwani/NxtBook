//
//  FullBookCell.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 11/22/18.
//  Copyright © 2018 Aatif Jiwani. All rights reserved.
//

import UIKit

class FullBookCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let image: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.white
        view.contentMode = .scaleAspectFit
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Fundamentals of Accounting"
        label.numberOfLines = 2
        label.textColor = UIColor.white
        label.font = UIFont(name: "Futura-Medium", size: 18)
        return label
    }()
    
    let authorLabel: UILabel = {
        let label = UILabel()
        label.text = "Aatif Jiwani"
        label.numberOfLines = 2
        label.textColor = Colors.nxtLightOrange
        label.font = UIFont(name: "Futura-Medium", size: 16)
        return label
    }()
    
    func setupViews() {
        backgroundColor = Colors.nxtGreen
        layer.cornerRadius = 10
//
        addSubview(image)
        image.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 5, leftConstant: 10, bottomConstant: 5, rightConstant: 0, widthConstant: 50, heightConstant: 0)
        
        addSubview(titleLabel)
        titleLabel.anchor(topAnchor, left: image.rightAnchor, bottom: nil, right: rightAnchor, topConstant: 5, leftConstant: 7, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 0)
        titleLabel.sizeToFit()
        
        addSubview(authorLabel)
        authorLabel.anchor(titleLabel.bottomAnchor, left: image.rightAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 7, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 0)
        authorLabel.sizeToFit()
    }
    
    var book: Book? {
        didSet {
            if let url = book?.coverPhotoUrl {
                image.loadImagesUsingCacheWithURLString(url: url)
            }
            
            if let title = book?.title {
                titleLabel.text = title
            }
            
            if let author = book?.author {
                authorLabel.text = "by \(author)"
            }
        }
    }
}
