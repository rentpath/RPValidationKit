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
    
    public func validate(fieldName: String, value: String) -> Validation {
        return Validation(isValid: validate(value), errorMessage: errorMessage(fieldName))
    }
    
    private func errorMessage(fieldName: String) -> String {
        return "\(fieldName) is required."
    }
}
