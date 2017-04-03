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
    
    let defaultColor = UIColor.black.withAlphaComponent(0.03)
    let validColor = UIColor.green.withAlphaComponent(0.1)
    let errorColor = UIColor.red.withAlphaComponent(0.1)
    
    @IBOutlet weak var emailTextField: UITextField! {
        didSet {
            emailTextField.validatableName = "Email Address"
            emailTextField.addTarget(self, action: #selector(validateTextFieldOnChange(_:)), for: .editingChanged)
            emailTextField.validators = [RPEmailValidator()]
            emailTextField.backgroundColor = defaultColor
            emailTextField.delegate = self
            validationManager.add(emailTextField)
        }
    }
    
    @IBOutlet weak var nameTextField: UITextField! {
        didSet {
            nameTextField.validatableName = "Name"
            nameTextField.addTarget(self, action: #selector(validateTextFieldOnChange(_:)), for: .editingChanged)
            nameTextField.validators = [RPRequiredValidator()]
            nameTextField.backgroundColor = defaultColor
            nameTextField.delegate = self
            validationManager.add(nameTextField)
        }
    }
    
    @IBOutlet weak var ageTextField: UITextField! {
        didSet {
            ageTextField.validatableName = "Age"
            ageTextField.addTarget(self, action: #selector(validateTextFieldOnChange(_:)), for: .editingChanged)
            ageTextField.validators = [RPIntegerValidator()]
            
            let maxValueValidator = RPMaxValueValidator(maxValue: 10)
            ageTextField.validators.append(maxValueValidator)
            
            ageTextField.backgroundColor = defaultColor
            ageTextField.delegate = self
            validationManager.add(ageTextField)
        }
    }
    
    @IBOutlet weak var phoneNumberTextField: UITextField! {
        didSet {
            phoneNumberTextField.validatableName = "Phone Number"
            phoneNumberTextField.delegate = self
            phoneNumberTextField.addTarget(self, action: #selector(validateTextFieldOnChange(_:)), for: .editingChanged)
            phoneNumberTextField.validators = [RPPhoneValidator()]
            phoneNumberTextField.backgroundColor = defaultColor
            phoneNumberTextField.delegate = self
            validationManager.add(phoneNumberTextField)
        }
    }
    
    @IBOutlet weak var sampleTextView: UITextView! {
        didSet {
            sampleTextView.validatableName = "Text View"
            sampleTextView.text = "This text view must have at least 20 characters to be valid"
            sampleTextView.delegate = self
            
            let minLengthValidator = RPMinLengthValidator()
            minLengthValidator.minLength = 20
            sampleTextView.validators = [minLengthValidator]
            sampleTextView.backgroundColor = defaultColor
            validationManager.add(sampleTextView)
        }
    }
    
    @IBOutlet weak var customView: CustomView! {
        didSet {
            validationManager.add(customView)
        }
    }
    
    @IBAction func validateAction(_ sender: AnyObject) {
        let result = validationManager.validate()
        print("result.isValid: \(result.isValid)")
        print("result.errorMessages: \(result.errorMessages)")
        
        for field in result.validFields {
            if let _field = field as? UIView {
                _field.backgroundColor = validColor
            }
        }
        
        for field in result.invalidFields {
            if let _field = field as? UIView {
                _field.backgroundColor = errorColor
            }
        }
    }
    
    @IBAction func resetAction(_ sender: AnyObject) {
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
        
    func validateTextFieldOnChange(_ textField: UITextField) {
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
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard textField == phoneNumberTextField else {
            return true
        }
        
        if string.characters.count == 0 && range.length > 0 {
            return true
        }
 
        textField.text = (textField.text! as NSString).replacingCharacters(in: range, with: string).format(.phoneNumber)
        validateTextFieldOnChange(textField)
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

extension ViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.validate().isValid {
            textView.backgroundColor = validColor
        } else {
            textView.backgroundColor = errorColor
        }
    }
}
