//
//  Validator.swift
//  RPValidationKit
//
//  Created by crebel on 3/28/16.
//  Copyright © 2016 Rentpath. All rights reserved.
//

import Foundation

public protocol Validator {
    
    func validate(value: String) -> Bool
    func validateField(fieldName: String, value: String) -> Validation
}
