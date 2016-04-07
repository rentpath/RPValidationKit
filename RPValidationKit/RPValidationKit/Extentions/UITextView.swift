//
//  UITextView.swift
//  RPValidationKit
//
//  Created by crebel on 4/7/16.
//  Copyright © 2016 Rentpath. All rights reserved.
//

import UIKit

extension UITextView: Validatable {
    
    public func validate() -> ValidationResult {
        var result = ValidationResult()
        
        for validator in validators {
            result.validations.append(validator.validateField(validatableName, value: self.text!))
        }
        
        return result
    }
}

