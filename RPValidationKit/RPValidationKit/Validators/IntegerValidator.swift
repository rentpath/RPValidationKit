//
//  IntegerValidator.swift
//  SwiftMaxLeasesPrototype
//
//  Created by mroider on 5/28/15.
//  Copyright (c) 2015 RentPath. All rights reserved.
//

import Foundation

public struct IntegerValidator: Validator {
    
    public init() {}
    
    public func validate(value: String) -> Bool {
        if let _ = Int(value) {
            return true
        }
        return false
    }
    
    public func validate(fieldName: String, value: String) -> Validation {
        return Validation(isValid: validate(value), errorMessage: errorMessage(fieldName))
    }
    
    private func errorMessage(fieldName: String) -> String {
        return "\(fieldName) is not an integer."
    }
}
