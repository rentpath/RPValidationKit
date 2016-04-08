//
//  PhoneValidator.swift
//  validationTest
//
//  Created by mroider on 5/14/15.
//  Copyright (c) 2015 rentpath. All rights reserved.
//

import Foundation

public struct PhoneValidator: Validator {
    var PHONEREGEX: String = "^\\d{10}$"
    
    public init() {}
    
    public func validate(value: String) -> Bool {
        let valueDigits = value.stringByReplacingOccurrencesOfString("[^0-9]", withString: "", options: NSStringCompareOptions.RegularExpressionSearch, range: Range<String.Index>(start: value.startIndex, end: value.endIndex))
        let range = valueDigits.rangeOfString(PHONEREGEX, options:.RegularExpressionSearch)
        return range != nil ? true : false
    }
    
    public func validateField(fieldName: String, value: String) -> Validation {
        if validate(value) {
            return Validation.Valid
        } else {
            return Validation.Error(message: "\(fieldName) is not a valid phone number.")
        }
    }
}
