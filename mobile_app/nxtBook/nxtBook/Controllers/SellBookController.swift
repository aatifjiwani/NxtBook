//
//  SellBookController.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 11/13/18.
//  Copyright © 2018 Aatif Jiwani. All rights reserved.
//

import UIKit

class SellBookController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    var indexController: IndexController?
    
    var user: User?
    
    let sellLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.text = "sell"
        label.font = UIFont(name: "Futura-Medium", size: 36)
        return label
    }()
    
    let backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "left-arrow"), for: .normal)
        return button
    }()
    
    let bookView = SellBookModal()
    
    let alertController = UIAlertController(title: "Choose method", message: "How would you like to upload your picture?", preferredStyle: .actionSheet)
    
    func setupViews() {
        setupBackground()
        
        let sendButton = UIAlertAction(title: "Choose from Photo Library", style: .default, handler: { (action) -> Void in
            self.changeWithLibrary()
            print("Library button tapped")
        })
        
        let  deleteButton = UIAlertAction(title: "Choose from Camera", style: .default, handler: { (action) -> Void in
            self.changeWithCamera()
            print("Camera button tapped")
        })
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) -> Void in
            print("Cancel button tapped")
        })
        
        alertController.addAction(sendButton)
        alertController.addAction(deleteButton)
        alertController.addAction(cancelButton)
        
        view.addSubview(backButton)
        backButton.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 30, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 30, heightConstant: 30)
        backButton.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        
        view.addSubview(sellLabel)
        sellLabel.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 75, leftConstant: 40, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        sellLabel.sizeToFit()
        
        view.addSubview(bookView)
        bookView.anchor(sellLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 20, leftConstant: 10, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 450)
        bookView.controller = self
    }
    
    @objc func handleBack() {
        if indexController != nil {
            let transition = CATransition()
            transition.duration = 0.5
            transition.type = kCATransitionFade
            transition.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
            view.window!.layer.add(transition, forKey: kCATransition)
            dismiss(animated: false, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var selectedImage: UIImage?
        
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            print(editedImage.size)
            selectedImage = editedImage
        } else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            print(originalImage.size)
            selectedImage = originalImage
        }
        
        if let toPut = selectedImage {
            bookView.coverPhoto.changeImage(image: toPut, name: "selectedImage")
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func changeCoverPhoto() {
        present(alertController, animated: true, completion: {
            return
        })
    }
    
    func changeWithLibrary() {
        print("going...")
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: {
            print("finished")
        })
    }
    
    func changeWithCamera() {
        print("going...")
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = UIImagePickerControllerSourceType.camera
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: {
            print("finished")
        })
    }
    
    func handleGoToConfirmPage() {
        let viewController = ConfirmBookController()
        viewController.typeConfirm = 0
        viewController.indexController = indexController
        viewController.user = user
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = kCATransitionFade
        transition.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        
        present(viewController, animated: false)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        bookView.sellBook.gradient.frame = bookView.sellBook.bounds
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

