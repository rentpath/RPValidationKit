//
//  SpecialCharactorValidator.swift
//  SwiftMaxLeasesPrototype
//
//  Created by mroider on 5/27/15.
//  Copyright (c) 2015 RentPath. All rights reserved.
//

import Foundation

public struct SpecialCharactorValidator: Validator {
    
    var SPECIALREGEX: String = ".*[^A-Za-z0-9 ].*"
    
    public init() {}
    
    public func validate(value: String) -> Bool {
        let range = value.rangeOfString(SPECIALREGEX, options:.RegularExpressionSearch)
        return range == nil ? true : false
    }
    
    public func validate(fieldName: String, value: String) -> Validation {
        return Validation(isValid: validate(value), errorMessage: errorMessage(fieldName))
    }
    
    private func errorMessage(fieldName: String) -> String {
        return "\(fieldName) contains invalid characters"
    }
}
