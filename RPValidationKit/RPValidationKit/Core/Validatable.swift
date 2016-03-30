//
//  Validatable.swift
//  RPValidationKit
//
//  Created by crebel on 3/28/16.
//  Copyright © 2016 Rentpath. All rights reserved.
//

import Foundation

public typealias ValidationDisplayHandler = () -> Void

public protocol Validatable {
    
    func validatableName() -> String
    func validate() -> FieldValidation
    func showValid() -> Void
    func showInvalid() -> Void
    func resetValidation() -> Void
}
