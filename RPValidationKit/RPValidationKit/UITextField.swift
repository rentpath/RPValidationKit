//
//  UITextField.swift
//  RPValidationKit
//
//  Created by crebel on 3/25/16.
//  Copyright © 2016 Rentpath. All rights reserved.
//

import UIKit
import ObjectiveC

private final class Box<T>: NSObject {
    let value: T
    
    init(value: T) {
        self.value = value
    }
}

public extension UITextField {

    private struct AssociatedKeys {
        static var fieldName = "fieldName"
        static var validators = "validators"
        static var validHandler = "validHandler"
        static var invalidHandler = "invalidHandler"
        static var resetHandler = "resetHandler"
    }
    
    public typealias Validators = [Validator]
    
    public var fieldName: String {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.fieldName) as? String ?? ""
        }
        set(newValue) {
            objc_setAssociatedObject(self, &AssociatedKeys.fieldName, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    public var validators: [Validator] {
        get {
            guard let box: Box<Validators>? = objc_getAssociatedObject(self, &AssociatedKeys.validators) as? Box<Validators> else {
                return []
            }
            return box?.value ?? []
        }
        set(newValue) {
            let box = Box<Validators>(value: newValue)
            objc_setAssociatedObject(self, &AssociatedKeys.validators, box, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    public var validHandler: ValidationDisplayHandler? {
        get {
            guard let box: Box<ValidationDisplayHandler>? = objc_getAssociatedObject(self, &AssociatedKeys.validHandler) as? Box<ValidationDisplayHandler> else {
                return nil
            }
            return box?.value
        }
        set(newValue) {
            if let _newValue = newValue {
                let box = Box<ValidationDisplayHandler>(value: _newValue)
                objc_setAssociatedObject(self, &AssociatedKeys.validHandler, box, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
    public var invalidHandler: ValidationDisplayHandler? {
        get {
            guard let box: Box<ValidationDisplayHandler>? = objc_getAssociatedObject(self, &AssociatedKeys.invalidHandler) as? Box<ValidationDisplayHandler> else {
                return nil
            }
            return box?.value
        }
        set(newValue) {
            if let _newValue = newValue {
                let box = Box<ValidationDisplayHandler>(value: _newValue)
                objc_setAssociatedObject(self, &AssociatedKeys.invalidHandler, box, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
    public var resetHandler: ValidationDisplayHandler? {
        get {
            guard let box: Box<ValidationDisplayHandler>? = objc_getAssociatedObject(self, &AssociatedKeys.resetHandler) as? Box<ValidationDisplayHandler> else {
                return nil
            }
            return box?.value
        }
        set(newValue) {
            if let _newValue = newValue {
                let box = Box<ValidationDisplayHandler>(value: _newValue)
                objc_setAssociatedObject(self, &AssociatedKeys.resetHandler, box, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
}

extension UITextField: Validatable {
    
    public func validatableName() -> String {
        return fieldName
    }
    
    public func validate() -> FieldValidation {
        
        var fieldValidation = FieldValidation(validatable: self)
        
        for validator in validators {
            fieldValidation.addValidation(validator.validate(validatableName(), value: self.text!))
        }
        
        if fieldValidation.isValid {
            showValid()
        } else {
            showInvalid()
        }
        
        return fieldValidation
    }
    
    public func showValid() {
        validHandler?()
    }
    
    public func showInvalid() {
        invalidHandler?()
    }
    
    public func resetValidation() {
        resetHandler?()
    }
}
