//
//  PicBookCell.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 10/23/18.
//  Copyright © 2018 Aatif Jiwani. All rights reserved.
//

import UIKit

class PicBookCell: UICollectionViewCell {
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
        return view
    }()
    
    func setupViews() {
        addSubview(image)
        image.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
    var book: Book? {
        didSet {
            if let url = book?.coverPhotoUrl {
                image.loadImagesUsingCacheWithURLString(url: url)
            }
        }
    }
}
