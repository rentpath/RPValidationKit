//
//  Validation.swift
//  RPValidationKit
//
//  Created by crebel on 3/28/16.
//  Copyright © 2016 Rentpath. All rights reserved.
//

import Foundation

public struct Validation {
    
    public var isValid: Bool
    public var errorMessage: String?
    
    public init(isValid: Bool, errorMessage: String?) {
        self.isValid = isValid
        self.errorMessage = errorMessage
    }
}
