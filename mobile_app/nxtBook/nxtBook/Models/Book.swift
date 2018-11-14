//
//  Book.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 10/11/18.
//  Copyright © 2018 Aatif Jiwani. All rights reserved.
//

import UIKit

class Book: NSObject {
    var title: String?
    var author: String?
    var edition: String?
    var isbn: String?
    var price: Double?
    var condition: Int?
    var coverPhotoUrl: String?
    
    init(json: [String: Any]) {
        self.title = json["title"] as? String
        self.author = json["author"] as? String
        self.isbn = json["isbn"] as? String
        self.price = json["price"] as? Double
        self.condition = json["condition"] as? Int
        self.edition = json["edition"] as? String
        self.coverPhotoUrl = json["coverPhotoUrl"] as? String
    }
    
    init(title: String, author: String, isbn: String, price: Double, condition: Int, edition: String?) {
        self.title = title
        self.author = author
        self.isbn = isbn
        self.price = price
        self.condition = condition
        self.edition = edition
    }
    
}
