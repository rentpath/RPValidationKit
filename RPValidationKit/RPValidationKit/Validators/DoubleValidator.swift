//
//  DoubleValidator.swift
//  RPValidationKit
//
//  Created by Jeremy Fox on 4/13/16.
//  Copyright © 2016 Rentpath. All rights reserved.
//

public struct DoubleValidator: Validator {
    
    public init() {}
    
    public func validate(value: String) -> Bool {
        if let _ = Double(value) {
            return true
        }
        return false
    }
    
    public func validateField(fieldName: String, value: String) -> Validation {
        if validate(value) {
            return Validation.Valid
        } else {
            return Validation.Error(message: "\(fieldName) is not a double.")
        }
    }
}
