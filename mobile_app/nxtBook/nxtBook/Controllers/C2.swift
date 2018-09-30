//
//  C2.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 9/30/18.
//  Copyright © 2018 Aatif Jiwani. All rights reserved.
//

import UIKit

class C2: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.purple
        f()
    }
    
    let button: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("weenus", for: .normal)
        return b
    }()
    
    func f() {
        view.addSubview(button)
        button.anchorCenterSuperview()
        button.addTarget(self, action: #selector(g), for: .touchUpInside)
    }
    
    @objc func g() {
        print("d")
        let c = C1()
        present(c, animated: true, completion: nil)
    }
    
}
