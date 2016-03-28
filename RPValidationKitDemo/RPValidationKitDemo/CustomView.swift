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
            textField.fieldName = "Some Required Field"
            textField.placeholder = "Required input"
            textField.validators = [RequiredValidator()]
        }
    }
}

extension CustomView: Validatable {
    
    func validate() -> FieldValidation {
        return textField.validate()
    }
    
    func validatableName() -> String {
        return "Custom View"
    }
}
