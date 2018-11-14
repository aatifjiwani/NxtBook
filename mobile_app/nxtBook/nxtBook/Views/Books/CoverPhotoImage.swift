//
//  CoverPhotoImage.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 11/13/18.
//  Copyright © 2018 Aatif Jiwani. All rights reserved.
//

import UIKit

class CoverPhotoImage: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var currName: String?
    
    func changeImage(image: UIImage, name: String?) {
        self.image = image
        currName = name
    }
}
