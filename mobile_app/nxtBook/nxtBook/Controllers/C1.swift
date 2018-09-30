//
//  C1.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 9/30/18.
//  Copyright © 2018 Aatif Jiwani. All rights reserved.
//

import UIKit

class C1: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.orange
        f()
    }
    
    let button: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("coccccckkkkkkk", for: .normal)
        return b
    }()
    
    func f() {
        view.addSubview(button)
        button.anchorCenterSuperview()
        button.addTarget(self, action: #selector(g), for: .touchUpInside)
    }
    
    @objc func g() {
        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
}
