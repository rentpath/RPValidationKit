//
//  MaxLengthValidator.swift
//  validationTest
//
//  Created by mroider on 5/14/15.
//  Copyright (c) 2015 rentpath. All rights reserved.
//

import Foundation

public struct MaxLengthValidator: Validator {
    var maxLength: Int = 256
    
    public init(length: Int) {
        maxLength = length
    }

    public func validate(value: String) -> Bool {
        return value.characters.count <= maxLength
    }

    public func validateField(fieldName: String, value: String) -> Validation {
        if validate(value) {
            return Validation.Valid
        } else {
            return Validation.Error(message: "\(fieldName) is too long.")
        }
    }
}
