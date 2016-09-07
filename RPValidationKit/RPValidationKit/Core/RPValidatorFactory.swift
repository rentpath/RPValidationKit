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
open class RPValidatorFactory {
    
    open static let sharedInstance = RPValidatorFactory()
    open var registry : [String : AnyClass?] = [:]
    
    public init() {
        let subclasses = RPValidationReflection.getSubclasses(RPValidator.self)
        for anyClass in subclasses! {
            let instance = RPValidationReflection.createObject(anyClass as! AnyClass, initializer: #selector(RPValidator.init), argument: nil) as! RPValidator
            registry[instance.getType()] = anyClass as? AnyClass
        }
    }
    
    open func createValidator(_ type: String) -> RPValidator {
        let typeParts = type.components(separatedBy: ":")
        let validatorType = typeParts[0]
        let args: String? = typeParts.count > 1 ? typeParts[1] : nil
        return RPValidationReflection.createObject(registry[validatorType]!, initializer: #selector(RPValidator.init), argument: args) as! RPValidator
    }
}
