//
//  UITextFieldExtension.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 1/19/19.
//  Copyright © 2019 Aatif Jiwani. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    func loadConditionDropdownData() {
        var data = [String]()
        
        for index in stride(from: 1, through: 5, by: 1) {
            data.append("\(index)")
        }
        
        self.inputView = FilterPickerView(pickerData: data, dropdownField: self)
    }
    
    func loadEditionDropdownData() {
        var data = [String]()
        
        for index in stride(from: 1, through: 20, by: 1) {
            var value = "\(index)"
            
            if index % 10 == 1 {
                value = value + "st"
            } else if index % 10 == 2 {
                value = value + "nd"
            } else if index % 10 == 3 {
                value = value + "rd"
            } else {
                value = value + "th"
            }
            
            data.append(value)
        }
        
        self.inputView = FilterPickerView(pickerData: data, dropdownField: self)
    }
    
    
}
