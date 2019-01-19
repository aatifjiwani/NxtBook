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
        getBooks()
    }
    
    var user: User? {
        didSet {
            
        }
    }
    
    var edition: String?
    var priceLow: Double?
    var priceHigh: Double?
    var condition: Int?
    
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
    
    let searchButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "search-button"), for: .normal)
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    let collectionBackground: BackgroundView = {
        let view = BackgroundView(frame: CGRect(x: 0, y: 0, width: 350, height: 580))
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return view
    }()
    
    let typeCollection = FullBookCollection()
    
    func getBooks() {
        APIServices.getBooks(query: nil, edition: nil, priceLow: nil, priceHigh: nil, condition: nil) { (response, status) in
            if status == 200 {
                print(response)
                
                guard let result = response else {
                    return
                }
                
                if let books = result["books"] as? NSArray {
                    //                print(sellingBooks)
                    if books.count > 0 {
                        self.typeCollection.loadBookData(data: books)
                    } else {
                        self.typeCollection.isLoading = false
                        self.typeCollection.collectionView.reloadData()
                    }
                    
                }
            }
        }
    }

    func setupViews() {
        setupBackground()
        
        view.addSubview(backButton)
        backButton.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 30, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 30, heightConstant: 30)
        backButton.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        
        view.addSubview(search)
        search.anchor(backButton.bottomAnchor, left: backButton.leftAnchor, bottom: nil, right: nil, topConstant: 15, leftConstant: -10, bottomConstant: 30, rightConstant: 0, widthConstant: 300, heightConstant: 50)
        
        view.addSubview(searchButton)
        searchButton.anchor(nil, left: search.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 5, bottomConstant: 0, rightConstant: 0, widthConstant: 40, heightConstant: 40)
        searchButton.centerYAnchor.constraint(equalTo: search.centerYAnchor).isActive = true
        searchButton.addTarget(self, action: #selector(handleSearch), for: .touchUpInside)
        
        view.addSubview(filterButton)
        filterButton.anchor(nil, left: searchButton.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 5, bottomConstant: 0, rightConstant: 0, widthConstant: 40, heightConstant: 30)
        filterButton.centerYAnchor.constraint(equalTo: search.centerYAnchor).isActive = true
        filterButton.addTarget(self, action: #selector(handleShowFilter), for: .touchUpInside)
        
        view.addSubview(titleBar)
        titleBar.anchor(search.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 10, leftConstant: 5, bottomConstant: 0, rightConstant: 5, widthConstant: 0, heightConstant: 10)
        
        view.addSubview(collectionBackground)
        collectionBackground.anchor(nil, left: nil, bottom: view.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 350, heightConstant: 580)
        collectionBackground.anchorCenterXToSuperview()
        
        view.addSubview(typeCollection)
        typeCollection.anchor(collectionBackground.topAnchor, left: collectionBackground.leftAnchor, bottom: collectionBackground.bottomAnchor, right: collectionBackground.rightAnchor, topConstant: 15, leftConstant: 15, bottomConstant: 0, rightConstant: 15, widthConstant: 0, heightConstant: 0)
        typeCollection.typeLayout = 3
        
    }
    
    @objc func handleBack() {
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = kCATransitionFade
        transition.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: false, completion: nil)
    }
    
    @objc func handleSearch() {
        var query = search.text
        
        if (query?.isEmpty)! {
            query = nil
        }
        
        typeCollection.clearBooks()
        
        APIServices.getBooks(query: query, edition: edition, priceLow: priceLow, priceHigh: priceHigh, condition: condition) { (response, status) in
            if status == 200 {
                print(response)
                
                guard let result = response else {
                    return
                }
                
                if let books = result["books"] as? NSArray {
                    //                print(sellingBooks)
                    if books.count > 0 {
                        self.typeCollection.loadBookData(data: books)
                    } else {
                        self.typeCollection.isLoading = false
                        self.typeCollection.collectionView.reloadData()
                    }
                    
                }
            }
        }
    }
    
    var partialWhiteBackground: UIView?
    var filterModal: BookFilterModal?
    
    @objc func handleShowFilter() {
        filterModal = BookFilterModal()
        filterModal?.alpha = 0
        filterModal?.controller = self
        
        
        if let window = UIApplication.shared.keyWindow {
            partialWhiteBackground = UIView(frame: window.frame)
            partialWhiteBackground?.backgroundColor = UIColor.white
            partialWhiteBackground?.alpha = 0
            
            let gesture = UITapGestureRecognizer(target: self, action: #selector(handleGoBack))
            partialWhiteBackground?.addGestureRecognizer(gesture)
            partialWhiteBackground?.isUserInteractionEnabled = true
            partialWhiteBackground?.isMultipleTouchEnabled = true
            
            window.addSubview(partialWhiteBackground!)
            window.addSubview(filterModal!)
            filterModal?.anchor(nil, left: window.leftAnchor, bottom: nil, right: window.rightAnchor, topConstant: 0, leftConstant: 20, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 420)
            filterModal?.anchorCenterYToSuperview()
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.filterModal?.alpha = 1
                self.partialWhiteBackground?.alpha = 0.7
            }) { (bool) in
                guard bool else {
                    return
                }
                
                //self.bookModal?.buyBook.gradient.frame = (self.bookModal?.buyBook.bounds)!
            }
        }
    }
    
    @objc func handleGoBack() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.filterModal?.alpha = 0
            self.partialWhiteBackground?.alpha = 0
        }, completion: { (completed) in
            self.filterModal?.removeFromSuperview()
            self.partialWhiteBackground?.removeFromSuperview()
        })
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
