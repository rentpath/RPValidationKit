//
//  MinLengthValidator.swift
//  validationTest
//
//  Created by mroider on 5/14/15.
//  Copyright (c) 2015 rentpath. All rights reserved.
//

import Foundation

public struct MinLengthValidator: Validator {
    var minLength: Int = 1
    
    public init(length: Int) {
        minLength = length
    }
    
    public func validate(value: String) -> Bool {
        return value.characters.count >= minLength
    }
    
    public func validate(fieldName: String, value: String) -> Validation {
        return Validation(isValid: validate(value), errorMessage: errorMessage(fieldName))
    }
    
    private func errorMessage(fieldName: String) -> String {
        return "\(fieldName) is too short."
    }
}
