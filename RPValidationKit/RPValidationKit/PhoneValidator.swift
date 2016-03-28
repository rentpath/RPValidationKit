//
//  PhoneValidator.swift
//  validationTest
//
//  Created by mroider on 5/14/15.
//  Copyright (c) 2015 rentpath. All rights reserved.
//

import Foundation

public struct PhoneValidator: Validator {
    var PHONEREGEX: String = "^[(]\\d{3}[)][\\s]\\d{3}-\\d{4}$"
    
    public init() {}
    
    public func validate(value: String) -> Bool {    
        let range = value.rangeOfString(PHONEREGEX, options:.RegularExpressionSearch)
        return range != nil ? true : false
    }
    
    public func validate(fieldName: String, value: String) -> Validation {
        return Validation(isValid: validate(value), errorMessage: errorMessage(fieldName))
    }
    
    private func errorMessage(fieldName: String) -> String {
        return "\(fieldName) is not a valid phone number."
    }
}
