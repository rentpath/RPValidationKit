//
//  Validatable.swift
//  RPValidationKit
//
//  Created by crebel on 3/28/16.
//  Copyright © 2016 Rentpath. All rights reserved.
//

import Foundation

public protocol Validatable: AnyObject {
    
    var isValid: Bool { get }
    var validatableName: String { get set }
    var validators: [Validator] { get set }
    
    func validate() -> ValidationResult
}


private final class Box<T>: NSObject {
    let value: T
    
    init(value: T) {
        self.value = value
    }
}

private var validatableNameKey: UInt8 = 0
private var validatorsKey: UInt8 = 0

extension Validatable {
    
    public var isValid: Bool {
        return self.validate().isValid
    }
    
    public var validatableName: String {
        get {
            return objc_getAssociatedObject(self, &validatableNameKey) as? String ?? "?"
        }
        set(newValue) {
            objc_setAssociatedObject(self, &validatableNameKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    public var validators: [Validator] {
        get {
            guard let box: Box<[Validator]>? = objc_getAssociatedObject(self, &validatorsKey) as? Box<[Validator]> else {
                return []
            }
            return box?.value ?? []
        }
        set(newValue) {
            let box = Box<[Validator]>(value: newValue)
            objc_setAssociatedObject(self, &validatorsKey, box, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
