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
        sizeToPut = 18
        setupViews()
    }
    
    var sizeToPut: CGFloat?
    
    init(frame: CGRect, height: CGFloat) {
        super.init(frame: frame)
        sizeToPut = height
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
        guard count > 0 && count <= 5 else {
            return
        }
        
        let stars: [UIImageView] = [starOne, starTwo, starThree, starFour, starFive]
        for i in 0...count-1 {
            stars[i].image = UIImage(named: "fill-star")
        }
        
        if count < 5 {
            for i in count...4 {
                stars[i].image = UIImage(named: "unfill-star")
            }
        }
    }
    
//    func changeHeight(height: CGFloat) {
//        starOneHeight?.isActive = false
//        starTwoHeight?.isActive = false
//        starThreeHeight?.isActive = false
//        starFourHeight?.isActive = false
//        starFiveHeight?.isActive = false
//
//        starOneHeight?.constant = height
//        starTwoHeight?.constant = height
//        starThreeHeight?.constant = height
//        starFourHeight?.constant = height
//        starFiveHeight?.constant = height
//
//        starOneHeight?.isActive = true
//        starTwoHeight?.isActive = true
//        starThreeHeight?.isActive = true
//        starFourHeight?.isActive = true
//        starFiveHeight?.isActive = true
//
//    }
//
//    var starOneHeight: NSLayoutConstraint?
//    var starTwoHeight: NSLayoutConstraint?
//    var starThreeHeight: NSLayoutConstraint?
//    var starFourHeight: NSLayoutConstraint?
//    var starFiveHeight: NSLayoutConstraint?
    
    func setupViews() {
        
        guard sizeToPut != nil else {
            return
        }
        
        addSubview(starOne)
        starOne.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: sizeToPut!, heightConstant: sizeToPut!)
        
//        starOneHeight = starOne.heightAnchor.constraint(equalToConstant: 18)
//        starOneHeight?.isActive = true
        
        addSubview(starTwo)
        starTwo.anchor(topAnchor, left: starOne.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 5, bottomConstant: 0, rightConstant: 0, widthConstant: sizeToPut!, heightConstant: sizeToPut!)
//        starTwoHeight = starTwo.heightAnchor.constraint(equalToConstant: 18)
//        starTwoHeight?.isActive = true
        
        addSubview(starThree)
        starThree.anchor(topAnchor, left: starTwo.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 5, bottomConstant: 0, rightConstant: 0, widthConstant: sizeToPut!, heightConstant: sizeToPut!)
//        starThreeHeight = starThree.heightAnchor.constraint(equalToConstant: 18)
//        starThreeHeight?.isActive = true
//
        addSubview(starFour)
        starFour.anchor(topAnchor, left: starThree.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 5, bottomConstant: 0, rightConstant: 0, widthConstant: sizeToPut!, heightConstant: sizeToPut!)
        
//        starFourHeight = starFour.heightAnchor.constraint(equalToConstant: 18)
//        starFourHeight?.isActive = true
        
        addSubview(starFive)
        starFive.anchor(topAnchor, left: starFour.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 5, bottomConstant: 0, rightConstant: 0, widthConstant: sizeToPut!, heightConstant: sizeToPut!)
//        starFiveHeight = starFive.heightAnchor.constraint(equalToConstant: 18)
//        starFiveHeight?.isActive = true
        
        configStars()
    }
    
    @objc func clickedStar(sender: UITapGestureRecognizer) {
        guard let ween = sender.view?.tag else {
            return
        }
        changeStarCount(count: ween)
    }
    
    func configStars() {
        let stars: [UIImageView] = [starOne, starTwo, starThree, starFour, starFive]
        for i in 0...4 {
            stars[i].tag = i + 1
            let gesture = UITapGestureRecognizer(target: self, action: #selector(clickedStar(sender:)))
            stars[i].addGestureRecognizer(gesture)
            stars[i].isUserInteractionEnabled = true
            stars[i].isMultipleTouchEnabled = true
        }
    }
    
    
}
