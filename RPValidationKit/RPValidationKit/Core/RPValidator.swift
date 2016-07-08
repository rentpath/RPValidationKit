//
//  Validator.swift
//  RPValidationKit
//
//  Created by crebel on 3/28/16.
//  Copyright © 2016 Rentpath. All rights reserved.
//

public class RPValidator: NSObject {
    
    public init(string: String? = nil) {
        
    }
    
    public func getType() -> String {
        fatalError("implement in subclass")
    }
    
    public func validate(value: String) -> Bool {
        fatalError("implement in subclass")
    }
    
    public func validateField(fieldName: String, value: String) -> RPValidation {
        fatalError("implement in subclass")
    }
}
