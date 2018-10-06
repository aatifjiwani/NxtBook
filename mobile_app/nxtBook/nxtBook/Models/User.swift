//
//  User.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 10/5/18.
//  Copyright © 2018 Aatif Jiwani. All rights reserved.
//

import UIKit

class User: NSObject {
    var isSignedIn: Bool?
    var email: String?
    var id: Int?
    var username: String?
    var firstname: String?
    var lastname: String?
    
    init(json: [String: Any]) {
        self.email = json["email"] as? String
        self.id = json["id"] as? Int
        self.username = json["username"] as? String
        self.firstname = json["firstname"] as? String
        self.lastname = json["lastname"] as? String
    }
}
