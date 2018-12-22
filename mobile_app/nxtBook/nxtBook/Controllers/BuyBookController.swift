//
//  BuyBookController.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 12/21/18.
//  Copyright © 2018 Aatif Jiwani. All rights reserved.
//

import UIKit

class BuyBookController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        navigationController?.navigationBar.isHidden = true
        setupViews()
    }
    
    var user: User? {
        didSet {
            
        }
    }
    
    let titleBar: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.nxtOrange
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    let search = SearchField()
    
    let backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "left-arrow"), for: .normal)
        return button
    }()
    
    let filterButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "filter-button"), for: .normal)
        return button
    }()
    
    let collectionBackground: BackgroundView = {
        let view = BackgroundView(frame: CGRect(x: 0, y: 0, width: 350, height: 580))
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return view
    }()
    
    let typeCollection = FullBookCollection()

    func setupViews() {
        setupBackground()
        
        view.addSubview(backButton)
        backButton.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 30, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 30, heightConstant: 30)
        backButton.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        
        view.addSubview(search)
        search.anchor(backButton.bottomAnchor, left: backButton.leftAnchor, bottom: nil, right: nil, topConstant: 15, leftConstant: 0, bottomConstant: 30, rightConstant: 0, widthConstant: 320, heightConstant: 50)
        
        view.addSubview(filterButton)
        filterButton.anchor(search.topAnchor, left: search.rightAnchor, bottom: search.bottomAnchor, right: nil, topConstant: 0, leftConstant: 5, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 50)
        
        view.addSubview(titleBar)
        titleBar.anchor(search.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 10, leftConstant: 5, bottomConstant: 0, rightConstant: 5, widthConstant: 0, heightConstant: 10)
        
        view.addSubview(collectionBackground)
        collectionBackground.anchor(nil, left: nil, bottom: view.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 350, heightConstant: 580)
        collectionBackground.anchorCenterXToSuperview()
        
        view.addSubview(typeCollection)
        typeCollection.anchor(collectionBackground.topAnchor, left: collectionBackground.leftAnchor, bottom: collectionBackground.bottomAnchor, right: collectionBackground.rightAnchor, topConstant: 15, leftConstant: 15, bottomConstant: 0, rightConstant: 15, widthConstant: 0, heightConstant: 0)
        
        typeCollection.loadBook(data: [Book]())
    }
    
    @objc func handleBack() {
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = kCATransitionFade
        transition.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: false, completion: nil)
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
