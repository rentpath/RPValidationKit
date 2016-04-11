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

    var validationManager = RPValidationManager()
    
    let defaultColor = UIColor.blackColor().colorWithAlphaComponent(0.03)
    let validColor = UIColor.greenColor().colorWithAlphaComponent(0.1)
    let errorColor = UIColor.redColor().colorWithAlphaComponent(0.1)
    
    @IBOutlet weak var emailTextField: UITextField! {
        didSet {
            emailTextField.validatableName = "Email Address"
            emailTextField.addTarget(self, action: #selector(validateTextFieldOnChange(_:)), forControlEvents: .EditingChanged)
            emailTextField.validators = [EmailValidator()]
            emailTextField.backgroundColor = defaultColor
            validationManager.add(emailTextField)
        }
    }
    
    @IBOutlet weak var nameTextField: UITextField! {
        didSet {
            nameTextField.validatableName = "Name"
            nameTextField.addTarget(self, action: #selector(validateTextFieldOnChange(_:)), forControlEvents: .EditingChanged)
            nameTextField.validators = [RequiredValidator()]
            nameTextField.backgroundColor = defaultColor
            validationManager.add(nameTextField)
        }
    }
    
    @IBOutlet weak var ageTextField: UITextField! {
        didSet {
            ageTextField.validatableName = "Age"
            ageTextField.addTarget(self, action: #selector(validateTextFieldOnChange(_:)), forControlEvents: .EditingChanged)
            ageTextField.validators = [IntegerValidator()]
            ageTextField.backgroundColor = defaultColor
            validationManager.add(ageTextField)
        }
    }
    
    @IBOutlet weak var phoneNumberTextField: UITextField! {
        didSet {
            phoneNumberTextField.validatableName = "Phone Number"
            phoneNumberTextField.delegate = self
            phoneNumberTextField.addTarget(self, action: #selector(validateTextFieldOnChange(_:)), forControlEvents: .EditingChanged)
            phoneNumberTextField.validators = [PhoneValidator()]
            phoneNumberTextField.backgroundColor = defaultColor
            validationManager.add(phoneNumberTextField)
        }
    }
    
    @IBOutlet weak var sampleTextView: UITextView! {
        didSet {
            sampleTextView.validatableName = "Text View"
            sampleTextView.text = "This text view must have at least 20 characters to be valid."
            sampleTextView.delegate = self
            sampleTextView.validators = [MinLengthValidator(length: 20)]
            sampleTextView.backgroundColor = defaultColor
            validationManager.add(sampleTextView)
        }
    }
    
    @IBOutlet weak var customView: CustomView! {
        didSet {
            validationManager.add(customView)
        }
    }
    
    @IBAction func validateAction(sender: AnyObject) {
        let result = validationManager.validate()
        print("result.isValid: \(result.isValid)")
        print("result.errorMessages: \(result.errorMessages)")
        
        for field in validationManager.validFields {
            if let _field = field as? UIView {
                _field.backgroundColor = validColor
            }
        }
        
        for field in validationManager.invalidFields {
            if let _field = field as? UIView {
                _field.backgroundColor = errorColor
            }
        }
    }
    
    @IBAction func resetAction(sender: AnyObject) {
        emailTextField.backgroundColor = defaultColor
        emailTextField.text = ""
        
        nameTextField.backgroundColor = defaultColor
        nameTextField.text = ""
        
        ageTextField.backgroundColor = defaultColor
        ageTextField.text = ""
        
        phoneNumberTextField.backgroundColor = defaultColor
        phoneNumberTextField.text = ""
        
        sampleTextView.backgroundColor = defaultColor
        sampleTextView.text = ""
        
        customView.reset()
    }
    
    deinit {
        print("im going away")
    }
        
    func validateTextFieldOnChange(textField: UITextField) {
//        if textField == phoneNumberTextField {
//            textField.text = textField.text?.format(.PhoneNumber)
//        }
        
        if textField.validate().isValid {
            textField.backgroundColor = validColor
        } else {
            textField.backgroundColor = errorColor
        }
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if string.characters.count == 0 && range.length > 0 {
            return true
        }
 
        textField.text = (textField.text! as NSString).stringByReplacingCharactersInRange(range, withString: string).format(.PhoneNumber)
        validateTextFieldOnChange(textField)
        return false
    }
}

extension ViewController: UITextViewDelegate {
    
    func textViewDidChange(textView: UITextView) {
        if textView.validate().isValid {
            textView.backgroundColor = validColor
        } else {
            textView.backgroundColor = errorColor
        }
    }
}
