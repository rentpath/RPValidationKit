//
//  CustomView.swift
//  RPValidationKitDemo
//
//  Created by crebel on 3/25/16.
//  Copyright © 2016 Rentpath. All rights reserved.
//

import UIKit
import RPValidationKit

class CustomView: UIView {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField! {
        didSet {
            textField.validatableName = "Some Required Field"
            textField.placeholder = "Required input"
            textField.validators = [RPRequiredValidator()]
            textField.delegate = self
        }
    }
    
    func reset() {
        backgroundColor = UIColor.whiteColor()
    }
}

extension CustomView: RPValidatable {
    
    func validate() -> RPValidationResult {
        var result = textField.validate()
        
        if result.isValid {
            result.validFields.append(self)
        } else {
            result.invalidFields.append(self)
        }
        
        return result
    }
}

extension CustomView: UITextFieldDelegate {
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}