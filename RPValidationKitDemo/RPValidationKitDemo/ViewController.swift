//
//  ViewController.swift
//  RPValidationKitDemo
//
//  Created by crebel on 3/25/16.
//  Copyright © 2016 Rentpath. All rights reserved.
//

import UIKit
import RPValidationKit

class ViewController: UIViewController {

    let validationManager = RPValidationManager()
    
    @IBOutlet weak var emailTextField: UITextField! {
        didSet {
            emailTextField.fieldName = "Email Address"
            emailTextField.validators = [EmailValidator()]
            validationManager.addValidatable(emailTextField)
        }
    }
    
    @IBOutlet weak var nameTextField: UITextField! {
        didSet {
            nameTextField.fieldName = "Name"
            nameTextField.validators = [SpecialCharactorValidator()]
            validationManager.addValidatable(nameTextField)
        }
    }
    
    @IBOutlet weak var ageTextField: UITextField! {
        didSet {
            ageTextField.fieldName = "Age"
            ageTextField.validators = [IntegerValidator()]
            validationManager.addValidatable(ageTextField)
        }
    }
    
    @IBOutlet weak var phoneNumberTextField: UITextField! {
        didSet {
            phoneNumberTextField.fieldName = "Phone Number"
            phoneNumberTextField.validators = [PhoneValidator()]
            validationManager.addValidatable(phoneNumberTextField)
        }
    }
    
    @IBOutlet weak var customView: CustomView! {
        didSet {
            validationManager.addValidatable(customView)
        }
    }
    
    @IBAction func validateAction(sender: AnyObject) {
    
        let result = validationManager.validate()
        print("result.isValid: \(result.isValid)")
        print("result.errorMessages: \(result.errorMessages)")
    }
}

