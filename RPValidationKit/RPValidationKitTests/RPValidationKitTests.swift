//
//  RPValidationKitTests.swift
//  RPValidationKitTests
//
//  Created by crebel on 3/25/16.
//  Copyright © 2016 Rentpath. All rights reserved.
//

import XCTest
@testable import RPValidationKit

class RPValidationKitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testIntegerValidation() {
        XCTAssert(RPIntegerValidator().validate("5") == true, "The value 5 did not validate as an integer")
        XCTAssert(RPIntegerValidator().validate("5.0") == false, "The value 5.0 validated as an integer")
    }
    
    func testFloatValidation() {
        XCTAssert(RPFloatValidator().validate("5.12345") == true, "The value 5.12345 did not validate as a double")
        XCTAssert(RPFloatValidator().validate("not a number") == false, "The value 5 validated as a double")
    }
    
    func testDoubleValidation() {
        XCTAssert(RPDoubleValidator().validate("5.0") == true, "The value 5.0 did not validate as an integer")
        XCTAssert(RPDoubleValidator().validate("not a number") == false, "The value 5 validated as a float")
    }

    func testMaxLengthValidation() {
        let maxLengthValidator = RPMaxLengthValidator()
        maxLengthValidator.maxLength = 5
        XCTAssert(maxLengthValidator.validate("hello") == true, "The value hello fails validation for max length 5")
        
        maxLengthValidator.maxLength = 3
        XCTAssert(maxLengthValidator.validate("hello") == false, "The value hello passes validation for max length 3")
    }

    func testMinLengthValidation() {
        let minLengthValidator = RPMinLengthValidator(minLength: 5)
        XCTAssert(minLengthValidator.validate("hello") == true, "The value hello fails validation for min length 5")
        
        minLengthValidator.minLength = 8
        XCTAssert(minLengthValidator.validate("hello") == false, "The value hello passes validation for min length 8")
    }
    
    func testEmailValidation() {
        XCTAssert(RPEmailValidator().validate("hello@test.com") == true, "The value hello@test.com fails validation for email")
        XCTAssert(RPEmailValidator().validate("hello@test") == false, "The value hello@test passes validation for email")
    }
    
    func testPhoneValidation() {
        XCTAssert(RPPhoneValidator().validate("(555) 555-5555") == true, "The value (555) 555-5555 fails validation for email")
        XCTAssert(RPPhoneValidator().validate("555-555-5555") == true, "The value 555-555-5555 fails validation for phone")
        XCTAssert(RPPhoneValidator().validate("5555555555") == true, "The value 5555555555 fails validation for phone")
        XCTAssert(RPPhoneValidator().validate("5555555") == false, "The value 5555555 passes validation for phone")
    }
    
    func testRequiredValidation() {
        XCTAssert(RPRequiredValidator().validate("hello") == true, "The value hello fails validation for required")
        XCTAssert(RPRequiredValidator().validate("") == false, "An empty string passes validation for required")
    }

    func testFieldValidation() {
        let textField = UITextField()
        textField.validators = [RPRequiredValidator()]
        
        let fail = textField.validate()
        XCTAssert(fail.isValid == false, "An empty string passes validation for required")
        XCTAssert(fail.errorMessages.count == 1, "The field validation did not have exactly 1 error message")
        
        textField.text = "hello"
        let success = textField.validate()
        XCTAssert(success.isValid == true, "The value hello fails validation for required")
        XCTAssert(success.errorMessages.count == 0, "The field validation had an error message")
    }
    
    func testFormValidator() {
        var validationManager = RPValidationManager()
        
        let nameField = UITextField()
        nameField.validators = [RPRequiredValidator()]
        nameField.validatableName = "Name"
        
        let ageField = UITextField()
        ageField.validators = [RPRequiredValidator(), RPIntegerValidator()]
        ageField.validatableName = "Age"
        
        validationManager.add(nameField)
        validationManager.add(ageField)
        
        let fail = validationManager.validate()
        XCTAssert(fail.isValid == false, "An empty string passes validation for required")
        XCTAssert(fail.errorMessages.count == 3, "The field validation did not have exactly 3 error messages")
        
        nameField.text = "hello"
        
        let stillFail = validationManager.validate()
        XCTAssert(stillFail.isValid == false, "An empty string passes validation for required")
        XCTAssert(stillFail.errorMessages.count == 2, "The field validation did not have exactly 2 error messages")
        
        ageField.text = "40"
        
        let success = validationManager.validate()
        XCTAssert(success.isValid == true, "The form failed validation")
        XCTAssert(success.errorMessages.count == 0, "The form validation had an error message")
    }
    
    func testInvalidFields() {
        var validationManager = RPValidationManager()
        
        let nameField = UITextField()
        nameField.validators = [RPRequiredValidator()]
        nameField.validatableName = "Name"
        
        let ageField = UITextField()
        ageField.validators = [RPRequiredValidator(), RPIntegerValidator()]
        ageField.validatableName = "Age"
        
        validationManager.add(nameField)
        validationManager.add(ageField)
        
        let result = validationManager.validate()
        XCTAssert(result.isValid == false, "The form failed validation")
        XCTAssert(result.errorMessages.count == 3, "The form validation should have 3 error messages but instead has \(result.errorMessages.count)")
        XCTAssert(result.invalidFields.count == 2, "There should be 2 invalid fields")
    }
    
    func testValidFields() {
        var validationManager = RPValidationManager()
        
        let nameField = UITextField()
        nameField.validators = [RPRequiredValidator()]
        nameField.validatableName = "Name"
        nameField.text = "Test"
        
        let ageField = UITextField()
        ageField.validators = [RPRequiredValidator(), RPIntegerValidator()]
        ageField.validatableName = "Age"
        ageField.text = "10"
        
        validationManager.add(nameField)
        validationManager.add(ageField)
        
        let result = validationManager.validate()
        XCTAssert(result.isValid == true, "The form failed validation")
        XCTAssert(result.errorMessages.count == 0, "The form validation should have 0 error messages but instead has \(result.errorMessages.count)")
        XCTAssert(result.validFields.count == 2, "There should be 2 valid fields")
    }
    
    func testValidatorFactory() {
        let maxLengthValidator = RPValidatorFactory.sharedInstance.createValidator("maxlength:10")
        XCTAssertNotNil(maxLengthValidator)
        
        let nameField = UITextField()
        nameField.validators = [maxLengthValidator]
        nameField.validatableName = "Name"
        nameField.text = "Test"
        
        let result = nameField.validate()
        XCTAssert(result.isValid == true, "The field should validate")
    }
}
