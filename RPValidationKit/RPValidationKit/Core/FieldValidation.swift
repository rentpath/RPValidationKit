//
//  FieldValidation.swift
//  RPValidationKit
//
//  Created by crebel on 3/28/16.
//  Copyright © 2016 Rentpath. All rights reserved.
//

import Foundation

public struct FieldValidation {
    
    public var validatable: Validatable
    public var validations: [Validation] = []
    
    public init(validatable: Validatable) {
        self.validatable = validatable
    }
    
    public mutating func addValidation(validation: Validation) {
        validations.append(validation)
    }
    
    public var isValid: Bool {
        for validation in validations {
            if validation.isValid == false {
                return false
            }
        }
        return true
    }
    
    public var errorMessages: [String] {
        var messages: [String] = []
        for validation in validations {
            if validation.isValid == false {
                if let _errorMessage = validation.errorMessage {
                    messages.append(_errorMessage)
                }
            }
        }
        return messages
    }
}
