//
//  ConditionStars.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 10/11/18.
//  Copyright © 2018 Aatif Jiwani. All rights reserved.
//

import UIKit

class ConditionStars: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let starOne: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "unfill-star")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let starTwo: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "unfill-star")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let starThree: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "unfill-star")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let starFour: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "unfill-star")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let starFive: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "unfill-star")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    func changeStarCount(count: Int) {
        let stars: [UIImageView] = [starOne, starTwo, starThree, starFour, starFive]
        for i in 0...count-1 {
            stars[i].image = UIImage(named: "fill-star")
        }
    }
    
    func setupViews() {
        addSubview(starOne)
        starOne.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 18, heightConstant: 18)
        
        addSubview(starTwo)
        starTwo.anchor(topAnchor, left: starOne.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 5, bottomConstant: 0, rightConstant: 0, widthConstant: 18, heightConstant: 18)
        
        addSubview(starThree)
        starThree.anchor(topAnchor, left: starTwo.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 5, bottomConstant: 0, rightConstant: 0, widthConstant: 18, heightConstant: 18)
        
        addSubview(starFour)
        starFour.anchor(topAnchor, left: starThree.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 5, bottomConstant: 0, rightConstant: 0, widthConstant: 18, heightConstant: 18)
        
        addSubview(starFive)
        starFive.anchor(topAnchor, left: starFour.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 5, bottomConstant: 0, rightConstant: 0, widthConstant: 18, heightConstant: 18)
    }
    
    
}
