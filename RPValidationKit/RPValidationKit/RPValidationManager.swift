//
//  RPValidationManager.swift
//  RPValidationKit
//
//  Created by crebel on 3/25/16.
//  Copyright © 2016 Rentpath. All rights reserved.
//

import Foundation

public class RPValidationManager {
    
    private var validatables: [Validatable] = []
    
    public init() {
        
    }
    
    public func addValidatable(validatable: Validatable) {
        validatables.append(validatable)
    }
    
    public func validate() -> FormValidation {
        
        let formValidation = FormValidation()
        
        for validatable in validatables {
            formValidation.addFieldValidation(validatable.validate())
        }
        
        return formValidation
    }
}

public protocol Validatable {
    
    func validatableName() -> String
    func validate() -> FieldValidation
}

@objc
public protocol Validator {
    
    func validate(value: String) -> Bool
    func validate(fieldName: String, value: String) -> Validation
}

public class Validation: NSObject {
    
    public var isValid: Bool
    public var errorMessage: String?
    
    public init(isValid: Bool, errorMessage: String?) {
        self.isValid = isValid
        self.errorMessage = errorMessage
    }
}

public class FieldValidation: NSObject {
    
    public var validations: [Validation] = []
    
    public func addValidation(validation: Validation) {
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

public class FormValidation: NSObject {
    
    public var validations: [FieldValidation] = []
    
    public func addFieldValidation(validation: FieldValidation) {
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
}