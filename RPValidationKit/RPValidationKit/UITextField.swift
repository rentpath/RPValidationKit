//
//  UITextField.swift
//  RPValidationKit
//
//  Created by crebel on 3/25/16.
//  Copyright © 2016 Rentpath. All rights reserved.
//

import UIKit
import ObjectiveC

public extension UITextField {

    private struct AssociatedKeys {
        static var fieldName = "fieldName"
        static var validators = "validators"
    }
    
    public var fieldName: String {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.fieldName) as? String ?? ""
        }
        set(newValue) {
            objc_setAssociatedObject(self, &AssociatedKeys.fieldName, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    public var validators: [Validator] {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.validators) as? [Validator] ?? []
        }
        set(newValue) {
            objc_setAssociatedObject(self, &AssociatedKeys.validators, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

extension UITextField: Validatable {
    
    public func validatableName() -> String {
        return fieldName
    }
    
    public func validate() -> FieldValidation {
        
        let fieldValidation = FieldValidation()
        
        for validator in validators {
            fieldValidation.addValidation(validator.validate(validatableName(), value: self.text!))
        }
        
        return fieldValidation
    }
}
