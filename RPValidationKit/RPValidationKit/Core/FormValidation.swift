//
//  FormValidation.swift
//  RPValidationKit
//
//  Created by crebel on 3/28/16.
//  Copyright © 2016 Rentpath. All rights reserved.
//

import Foundation

public struct FormValidation {
    
    public var validations: [FieldValidation] = []
    
    public mutating func addFieldValidation(validation: FieldValidation) {
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
            messages += validation.errorMessages
        }
        return messages
    }
    
    public var fields: [Validatable] {
        var fields: [Validatable] = []
        
        for validation in validations {
            if validation.isValid == false {
                fields.append(validation.validatable)
            }
        }
        return fields
    }
}
