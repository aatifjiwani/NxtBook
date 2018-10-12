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
    
    init(json: [String: Any]) {
        //TO IMPLEMENT LATER
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
