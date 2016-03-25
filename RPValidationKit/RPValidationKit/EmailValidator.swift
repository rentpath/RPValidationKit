//
//  EmailValidator.swift
//  validationTest
//
//  Created by mroider on 5/14/15.
//  Copyright (c) 2015 rentpath. All rights reserved.
//

import UIKit

public class EmailValidator: NSObject, Validator {
    var EMAILREGEX: String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}$"
    
    public func validate(value: String) -> Bool {
        let components = value.componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        if components.count > 1 {
            return false
        }
        
        let range = value.rangeOfString(EMAILREGEX, options:.RegularExpressionSearch)
        return (range != nil ? true : false)
        
    }
    
    public func validate(fieldName: String, value: String) -> Validation {
        return Validation(isValid: validate(value), errorMessage: errorMessage(fieldName))
    }
    
    private func errorMessage(fieldName: String) -> String {
        return "\(fieldName) is not a valid email."
    }
}
