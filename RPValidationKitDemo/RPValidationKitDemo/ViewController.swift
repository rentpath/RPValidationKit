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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let validationKit = RPValidationManager()
        validationKit.validate()
        
        let textField1 = UITextField()
        textField1.fieldName = "First Name"
        textField1.validators = [RequiredValidator(), PhoneValidator()]
        textField1.text = "(770) 853-8602"
        
        let textField2 = UITextField()
        textField2.fieldName = "First Name"
        textField2.validators = [RequiredValidator()]
        textField2.text = "Bob Jones"
        
        let validationManager = RPValidationManager()
        validationManager.addValidatable(textField1)
        validationManager.addValidatable(textField2)
        
        let result = validationManager.validate()
        
        print("result.isValid: \(result.isValid)")
        print("result.errorMessages: \(result.errorMessages)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

