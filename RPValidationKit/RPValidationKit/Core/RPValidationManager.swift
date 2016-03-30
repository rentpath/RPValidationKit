//
//  RPValidationManager.swift
//  RPValidationKit
//
//  Created by crebel on 3/25/16.
//  Copyright © 2016 Rentpath. All rights reserved.
//

import Foundation

public class RPValidationManager {
    
    var validatables: [Validatable] = []
    
    public init() {}
    
    public func addValidatable(validatable: Validatable) {
        validatables.append(validatable)
    }
    
    public func validate() -> FormValidation {
        reset()
        
        var formValidation = FormValidation()
        
        for validatable in validatables {
            formValidation.addFieldValidation(validatable.validate())
        }
        
        return formValidation
    }
    
    public func reset() {
        for validatable in validatables {
            validatable.resetValidation()
        }
    }
}
