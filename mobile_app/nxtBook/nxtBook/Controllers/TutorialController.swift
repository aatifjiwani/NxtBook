//
//  TutorialController.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 10/10/18.
//  Copyright © 2018 Aatif Jiwani. All rights reserved.
//

import UIKit

class TutorialController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        canContinue = false
    }
    
    var canContinue: Bool = true
    
    var toUser: User? {
        didSet {
            welcomeModal.changeWelcomeString(first: (toUser?.firstname)!)
        }
    }
    
    let welcomeModal = Welcome()
    
    let buyAndSellModal = BuyAndSell()
    
    let searchModal = Search()
    
    let findBookModal = FindBook()
    
    let chatModal = ChatToBuy()
    
    let completeModal = MarkAsComplete()
    
    let sellModal = SellABook()
    
    let tapToContinue: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }()
    
    let tapImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "tap-screen")
        return image
    }()
    
    let tapLabel: UILabel = {
        let label = UILabel()
        label.text = "tap to continue"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Futura-Medium", size: 24)
        return label
    }()
    
    var tutorialModals: [UIView]?
    
    var currIndex = 0
    
    func setupViews() {
        setupBackground()

        view.addSubview(welcomeModal)
        welcomeModal.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        view.addSubview(tapToContinue)
        tapToContinue.anchorCenterXToSuperview()
        tapToContinue.anchor(nil, left: nil, bottom: view.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 100, rightConstant: 0, widthConstant: 200, heightConstant: 100)
        tapToContinue.alpha = 0
        
        tapToContinue.addSubview(tapImage)
        tapImage.anchor(tapToContinue.topAnchor, left: tapToContinue.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 32, heightConstant: 32)
        
        tapToContinue.addSubview(tapLabel)
        tapLabel.anchor(nil, left: tapImage.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 5, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        tapLabel.sizeToFit()
        tapLabel.centerYAnchor.constraint(equalTo: tapImage.centerYAnchor).isActive = true
        
        view.addSubview(buyAndSellModal)
        buyAndSellModal.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        buyAndSellModal.alpha = 0

        view.addSubview(searchModal)
        searchModal.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        searchModal.alpha = 0

        view.addSubview(findBookModal)
        findBookModal.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        findBookModal.alpha = 0

        view.addSubview(chatModal)
        chatModal.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        chatModal.alpha = 0
        
        view.addSubview(completeModal)
        completeModal.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        completeModal.alpha = 0
        
        view.addSubview(sellModal)
        sellModal.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        sellModal.alpha = 0
        
        view.isUserInteractionEnabled = true
        view.isMultipleTouchEnabled = true
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleContinueTut))
        view.addGestureRecognizer(gesture)
    }
    
    @objc func handleContinueTut() {
        guard canContinue && tutorialModals != nil else {
            return
        }
        
        guard currIndex != (tutorialModals?.count)! - 1 else {
            //do stuff
            let viewController = IndexController()
            viewController.user = toUser
            let transition = CATransition()
            transition.type = kCATransitionFromBottom
            if let window = UIApplication.shared.keyWindow {
                window.set(rootViewController: viewController, withTransition: transition)
            }
            return
        }
        
        tapToContinue.isHidden = true
        let modals = tutorialModals!
        performAnimationsOnViews(fadeOutView: modals[currIndex], fadeInView: modals[currIndex + 1])
    }
    
    func performAnimationsOnViews(fadeOutView: UIView, fadeInView: UIView) {
        canContinue = false
        currIndex = currIndex + 1
        fadeOutView.alpha = 1
        fadeInView.alpha = 0
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut, animations: {
            fadeOutView.alpha = 0
        }) { (bool) in
            fadeOutView.alpha = 0
            fadeInView.alpha = 0
            if (bool) {
                UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut, animations: {
                    fadeInView.alpha = 1
                }, completion: { (bool) in
                    fadeInView.alpha = 1
                    fadeOutView.alpha = 0
                    self.canContinue = true
                })
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        findBookModal.bookView.buyBook.gradient.frame = findBookModal.bookView.buyBook.bounds
        completeModal.yesButton.gradient.frame = completeModal.yesButton.bounds
        completeModal.noButton.gradient.frame = completeModal.noButton.bounds
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tapToContinue.alpha = 0
        canContinue = false
        UIView.animate(withDuration: 0.5, delay: 1, options: .curveEaseOut, animations: {
            self.tapToContinue.alpha = 1
        }) { (bool) in
            self.tapToContinue.alpha = 1
            self.canContinue = true
            self.tutorialModals = [self.welcomeModal, self.buyAndSellModal, self.searchModal, self.findBookModal, self.chatModal, self.completeModal, self.sellModal]
        }
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
