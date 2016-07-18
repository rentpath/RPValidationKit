//
//  RPValidatorFactory.swift
//  RPValidationKit
//
//  Created by crebel on 7/11/16.
//  Copyright © 2016 Rentpath. All rights reserved.
//

import Foundation

/**
 Finds all sublcasses of RPExternalCardConverter and registers them to be created based on a string value.
 */
public class RPValidatorFactory {
    
    public static let sharedInstance = RPValidatorFactory()
    public var registry : [String : AnyClass!] = [:]
    
    public init() {
        let subclasses = RPValidationReflection.getSubclasses(RPValidator)
        for anyClass in subclasses {
            let instance = RPValidationReflection.createObject(anyClass as! AnyClass, initializer: #selector(RPValidator.init), argument: nil) as! RPValidator
            registry[instance.getType()] = anyClass as? AnyClass
        }
    }
    
    public func createValidator(type: String) -> RPValidator {
        let typeParts = type.componentsSeparatedByString(":")
        let validatorType = typeParts[0]
        let args: String? = typeParts.count > 1 ? typeParts[1] : nil
        return RPValidationReflection.createObject(registry[validatorType], initializer: #selector(RPValidator.init), argument: args) as! RPValidator
    }
}