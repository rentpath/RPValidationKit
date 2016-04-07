//
//  RequiredValidator.swift
//  validationTest
//
//  Created by mroider on 5/14/15.
//  Copyright (c) 2015 rentpath. All rights reserved.
//

import Foundation

public struct RequiredValidator: Validator {
    
    public init() {}
    
    public func validate(value: String) -> Bool {
        let trimmedString = value.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        return !trimmedString.isEmpty
    }
    
    public func validateField(fieldName: String, value: String) -> Validation {
        if validate(value) {
            return Validation.Valid
        } else {
            return Validation.Error(message: "\(fieldName) is required")
        }
    }
}
