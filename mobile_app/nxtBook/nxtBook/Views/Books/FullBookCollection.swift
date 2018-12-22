//
//  FullBookCollection.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 11/22/18.
//  Copyright © 2018 Aatif Jiwani. All rights reserved.
//

import UIKit

class FullBookCollection: UIView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        print(layout.itemSize)
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        cv.register(FullBookCell.self, forCellWithReuseIdentifier: picBookCellID)
        cv.backgroundColor = UIColor.clear
        cv.alwaysBounceVertical = true
        return cv
        
    }()
    
    var books = [Book]()
    
    var isLoading = true
    
    func collectionView(_ collectionView: UICollectionView, numberOfSections section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isLoading {
            return 3
        } else {
            return books.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: picBookCellID, for: indexPath) as! FullBookCell
        
        
        if !isLoading {
            cell.book = books[indexPath.item]
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.size.width, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected item")
        let selectedBook = books[indexPath.item]
        showBookModal(book: selectedBook)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        
        addSubview(collectionView)
        collectionView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
    override var bounds: CGRect {
        didSet {
            print(bounds)
            if oldValue != bounds {
                self.collectionView.frame = bounds
                self.collectionView.reloadData()
            }
        }
    }
    
    let picBookCellID = "picBookCellID"
    
    var partialWhiteBackground: UIView?
    var bookModal: DynamicBookModal?
    
    func showBookModal(book: Book) {
        bookModal = DynamicBookModal()
        bookModal?.alpha = 0
        
        if let window = UIApplication.shared.keyWindow {
            partialWhiteBackground = UIView(frame: window.frame)
            partialWhiteBackground?.backgroundColor = UIColor.white
            partialWhiteBackground?.alpha = 0
            
            let gesture = UITapGestureRecognizer(target: self, action: #selector(handleGoBack))
            partialWhiteBackground?.addGestureRecognizer(gesture)
            partialWhiteBackground?.isUserInteractionEnabled = true
            partialWhiteBackground?.isMultipleTouchEnabled = true
            
            window.addSubview(partialWhiteBackground!)
            window.addSubview(bookModal!)
            bookModal?.anchor(nil, left: window.leftAnchor, bottom: nil, right: window.rightAnchor, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 360)
            bookModal?.anchorCenterYToSuperview()
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.bookModal?.alpha = 1
                self.partialWhiteBackground?.alpha = 0.7
            }) { (bool) in
                guard bool else {
                    return
                }
                
                self.bookModal?.buyBook.gradient.frame = (self.bookModal?.buyBook.bounds)!
            }
        }
    }
    
    @objc func handleGoBack() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.bookModal?.alpha = 0
            self.partialWhiteBackground?.alpha = 0
        }, completion: { (completed) in
            self.bookModal?.removeFromSuperview()
            self.partialWhiteBackground?.removeFromSuperview()
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadBook(data: [Book]) {
        for item in data  {
            books.append(item)
        }
        
        isLoading = false
        collectionView.reloadData()
    }
}
