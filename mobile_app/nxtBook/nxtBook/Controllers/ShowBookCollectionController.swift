//
//  ShowBookCollectionController.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 11/22/18.
//  Copyright © 2018 Aatif Jiwani. All rights reserved.
//

import UIKit

class ShowBookCollectionController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    var backController: ProfileController?
    
    var user: User?
    
    let typeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.text = "type"
        label.font = UIFont(name: "Futura-Medium", size: 36)
        return label
    }()
    
    let backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "left-arrow"), for: .normal)
        return button
    }()
    
    let collectionBackground: BackgroundView = {
        let view = BackgroundView(frame: CGRect(x: 0, y: 0, width: 350, height: 600))
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return view
    }()
    
    let typeCollection = FullBookCollection()
    
    func setupTypeOfBooks(title: String, books: [Book], tag: Int?) {
        //tag = 0 --> No button appears on collection
        //tag = 1 --> Chat button appears on collection
        //tag = 2 --> Chat and Complete button appears on collection
        
        typeLabel.text = title
        typeCollection.loadBook(data: books)
    }
    
    func setupViews() {
        setupBackground()
        
        view.addSubview(backButton)
        backButton.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 30, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 30, heightConstant: 30)
        backButton.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        
        view.addSubview(typeLabel)
        typeLabel.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 75, leftConstant: 40, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        typeLabel.sizeToFit()
        
        view.addSubview(collectionBackground)
        collectionBackground.anchor(nil, left: nil, bottom: view.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 350, heightConstant: 600)
        collectionBackground.anchorCenterXToSuperview()
        
        view.addSubview(typeCollection)
        typeCollection.anchor(collectionBackground.topAnchor, left: collectionBackground.leftAnchor, bottom: collectionBackground.bottomAnchor, right: collectionBackground.rightAnchor, topConstant: 15, leftConstant: 15, bottomConstant: 0, rightConstant: 15, widthConstant: 0, heightConstant: 0)

    }
    
    @objc func handleBack() {
        if backController != nil {
            let transition = CATransition()
            transition.duration = 0.5
            transition.type = kCATransitionFade
            transition.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
            view.window!.layer.add(transition, forKey: kCATransition)
            dismiss(animated: false, completion: nil)
        }
    }
    
    override func viewDidLayoutSubviews() {
        
    }
    
    func setupBackground() {
        var gradientLayer: CAGradientLayer!
        
        gradientLayer = CAGradientLayer()
        
        gradientLayer.startPoint = CGPoint(x: 0.2, y: 0.2)
        gradientLayer.endPoint = CGPoint(x: 0.8, y: 0.8)
        
        gradientLayer.frame = self.view.bounds
        
        gradientLayer.colors = [Colors.nxtGreen.cgColor, Colors.nxtBlue.cgColor]
        
        self.view.layer.addSublayer(gradientLayer)
    }
    
    
}

