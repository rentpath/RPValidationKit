//
//  NumericValidator.swift
//  RPValidationKit
//
//  Created by Jeremy Fox on 4/13/16.
//  Copyright © 2016 Rentpath. All rights reserved.
//

public struct NumbericValidator: Validator {
    
    public init() {}
    
    public func validate(value: String) -> Bool {
        let alphaNumbersSet = NSCharacterSet.decimalDigitCharacterSet()
        let stringSet = NSCharacterSet(charactersInString: value)
        if alphaNumbersSet.isSupersetOfSet(stringSet) {
            return true
        }
        
        if IntegerValidator().validate(value) {
            return true
        }
        
        if FloatValidator().validate(value) {
            return true
        }
        
        if DoubleValidator().validate(value) {
            return true
        }
        
        return false
    }
    
    public func validateField(fieldName: String, value: String) -> Validation {
        if validate(value) {
            return Validation.Valid
        } else {
            return Validation.Error(message: "\(fieldName) is not numeric.")
        }
    }
}
