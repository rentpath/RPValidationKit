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
    
    let errorColor = UIColor.redColor().colorWithAlphaComponent(0.1)
    let normalColor = UIColor.whiteColor()
    
    @IBOutlet weak var emailTextField: UITextField! {
        didSet {
            emailTextField.fieldName = "Email Address"
            emailTextField.validators = [EmailValidator()]
            emailTextField.invalidHandler = { [unowned self] in
                self.emailTextField.backgroundColor = self.errorColor
            }
            emailTextField.resetHandler = { [unowned self] in
                self.emailTextField.backgroundColor = self.normalColor
            }
            validationManager.addValidatable(emailTextField)
        }
    }
    
    @IBOutlet weak var nameTextField: UITextField! {
        didSet {
            nameTextField.fieldName = "Name"
            nameTextField.validators = [SpecialCharactorValidator(), RequiredValidator()]
            nameTextField.invalidHandler = { [unowned self] in
                self.nameTextField.backgroundColor = self.errorColor
            }
            nameTextField.resetHandler = { [unowned self] in
                self.nameTextField.backgroundColor = self.normalColor
            }
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
            phoneNumberTextField.delegate = self
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
    
    @IBAction func resetAction(sender: AnyObject) {
        validationManager.reset()
    }
    
    deinit {
        print("im going away")
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if string.characters.count == 0 && range.length > 0 {
            return true
        }
        
        textField.text = (textField.text! as NSString).stringByReplacingCharactersInRange(range, withString: string).format(.PhoneNumber)
        return false
    }
}

