//
//  RPValidationManager.swift
//  RPValidationKit
//
//  Created by crebel on 3/25/16.
//  Copyright © 2016 Rentpath. All rights reserved.
//

import Foundation

public struct RPValidationManager {
    
    var validatables: [Validatable] = []
    
    public var validFields: [Validatable] {
        return validatables.filter() {
            $0.isValid
        }
    }
    
    public var invalidFields: [Validatable] {
        return validatables.filter() {
            !$0.isValid
        }
    }
    
    public init() {}
    
    public mutating func add(validatable: Validatable) {
        validatables.append(validatable)
    }
    
    public mutating func removeValidatableNamed(name validatableNameToRemove: String) {
        while let index = validatableIndex(validatableNameToRemove) {
            validatables.removeAtIndex(index)
        }
    }
    
    func validatableIndex(validatableNameToFind: String) -> Int? {
        var index = 0
        
        while index < validatables.count {
            let validatable = validatables[index]
            if validatable.validatableName == validatableNameToFind {
                return index
            }
            index = index + 1
        }
        
        return nil
    }
    
    public func validate() -> ValidationResult {
        var result = ValidationResult()
        
        for validatable in validatables {
            result.combine(validatable.validate())
        }
        
        return result
    }
}
