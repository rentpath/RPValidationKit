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
            textField.validators = [RequiredValidator()]
        }
    }
    
    func reset() {
        backgroundColor = UIColor.whiteColor()
    }
}

extension CustomView: Validatable {
    
    func validate() -> ValidationResult {
        let result = textField.validate()
        
        if result.isValid {
            backgroundColor = UIColor.greenColor().colorWithAlphaComponent(0.1)
        } else {
            backgroundColor = UIColor.redColor().colorWithAlphaComponent(0.1)
        }
        
        return textField.validate()
    }
}
