//
//  Validator.swift
//  RPValidationKit
//
//  Created by crebel on 3/28/16.
//  Copyright © 2016 Rentpath. All rights reserved.
//

import Foundation

open class RPValidator: NSObject {
    
    public init(string: String? = nil) {
        
    }
    
    open func getType() -> String {
        fatalError("implement in subclass")
    }
    
    open func validate(_ value: String) -> Bool {
        fatalError("implement in subclass")
    }
    
    open func validateField(_ fieldName: String, value: String) -> RPValidation {
        fatalError("implement in subclass")
    }
}
