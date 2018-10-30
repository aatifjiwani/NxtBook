//
//  EditProfileController.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 10/23/18.
//  Copyright © 2018 Aatif Jiwani. All rights reserved.
//

import UIKit

class EditProfileController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    var indexController: IndexController?
    
    var user: User? {
        didSet {
            firstname.text = user?.firstname
        }
    }
    
    let editProfileLabel: UILabel = {
        let label = UILabel()
        label.text = "edit profile"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Futura-Medium", size: 24)
        return label
    }()
    
    let firstname: UILabel = {
        let label = UILabel()
        label.text = "..."
        label.textColor = UIColor.white
        label.font = UIFont(name: "Futura-Medium", size: 36)
        return label
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.white
        imageView.layer.cornerRadius = 63
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "left-arrow"), for: .normal)
        return button
    }()
    
    let changePassBackground: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.nxtOrange
        view.layer.cornerRadius = 28
        view.layer.masksToBounds = true
        return view
    }()
    
    let changePassword: UILabel = {
        let label = UILabel()
        label.text = "change password"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Futura-Medium", size: 24)
        return label
    }()
    
    let creditCardBackground: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.nxtGreen
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        return view
    }()
    
    let creditCard: UILabel = {
        let label = UILabel()
        label.text = "credit card"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Futura-Medium", size: 24)
        return label
    }()
    
    let venmoBackground: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.nxtGreen
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        return view
    }()
    
    let venmo: UILabel = {
        let label = UILabel()
        label.text = "venmo"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Futura-Medium", size: 24)
        return label
    }()
    
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
        
        view.addSubview(editProfileLabel)
        editProfileLabel.anchor(view.topAnchor, left: nil, bottom: nil, right: nil, topConstant: 75, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        editProfileLabel.anchorCenterXToSuperview()
        editProfileLabel.sizeToFit()
        
        view.addSubview(profileImageView)
        profileImageView.anchor(editProfileLabel.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 50, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 126, heightConstant: 126)
        profileImageView.anchorCenterXToSuperview()
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleChangePicture))
        profileImageView.isUserInteractionEnabled = true
        profileImageView.addGestureRecognizer(gesture)
        
        view.addSubview(firstname)
        firstname.anchor(profileImageView.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 15, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        firstname.anchorCenterXToSuperview()
        firstname.sizeToFit()
        
        view.addSubview(changePassBackground)
        changePassBackground.anchorCenterXToSuperview()
        changePassBackground.anchor(firstname.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 50, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 235, heightConstant: 56)
        
        changePassBackground.addSubview(changePassword)
        changePassword.anchorCenterSuperview()
        changePassword.sizeToFit()
        
        view.addSubview(creditCardBackground)
        creditCardBackground.anchor(changePassBackground.bottomAnchor, left: nil, bottom: nil, right: view.centerXAnchor, topConstant: 25, leftConstant: 0, bottomConstant: 0, rightConstant: 10, widthConstant: 175, heightConstant: 60)
        
        creditCardBackground.addSubview(creditCard)
        creditCard.anchorCenterSuperview()
        creditCard.sizeToFit()
        
        view.addSubview(venmoBackground)
        venmoBackground.anchor(changePassBackground.bottomAnchor, left: view.centerXAnchor, bottom: nil, right: nil, topConstant: 25, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 175, heightConstant: 60)
        venmoBackground.addSubview(venmo)
        venmo.anchorCenterSuperview()
        venmo.sizeToFit()
        
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
        
        dismiss(animated: true, completion: nil)
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
    
    @objc func handleChangePicture() {
        print("p")
        present(alertController, animated: true, completion: {
            return
        })
//        print("going...")
//        let imagePicker = UIImagePickerController()
//        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
//        imagePicker.delegate = self
//        imagePicker.allowsEditing = true
//        present(imagePicker, animated: true, completion: {
//            print("finished")
//        })
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
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

