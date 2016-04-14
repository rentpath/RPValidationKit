//
//  ValidationResult.swift
//  RPValidationKit
//
//  Created by crebel on 4/6/16.
//  Copyright © 2016 Rentpath. All rights reserved.
//

import Foundation

public struct ValidationResult {
    
    public var validations: [Validation] = []
    
    public var isValid: Bool {
        for validation in validations {
            switch validation {
            case .Valid: continue
            case .Error: return false
            }
        }
        
        return true
    }
    
    public var errorMessages: [String] {
        var messages: [String] = []
        for validation in validations {
            switch validation {
            case .Valid: continue
            case .Error(let message): messages.append(message)
            }
        }
        return messages
    }
    
    mutating func combine(result: ValidationResult) {
        self.validations = self.validations + result.validations
    }
}