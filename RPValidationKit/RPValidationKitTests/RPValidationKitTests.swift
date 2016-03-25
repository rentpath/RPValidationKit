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
    
    func testIntegerValidationWithInt() {
        XCTAssert(IntegerValidator().validate("5") == true, "The value 5 did not validate as an integer")
    }
    
    func testIntegerValidationWithDouble() {
        XCTAssert(IntegerValidator().validate("5.0") == false, "The value 5.0 validated as an integer")
    }
    
    func testMaxLengthValidationPass() {
        XCTAssert(MaxLengthValidator(length: 4).validate("test") == true, "The value test fails validation for max length 4")
    }
    
    func testMaxLengthValidationFail() {
        XCTAssert(MaxLengthValidator(length: 3).validate("test") == false, "The value test passes validation for max length 3")
    }
    
    func testMinLengthValidationPass() {
        XCTAssert(MinLengthValidator(length: 4).validate("test") == true, "The value test fails validation for min length 4")
    }
    
    func testMinLengthValidationFail() {
        XCTAssert(MinLengthValidator(length: 8).validate("test") == false, "The value test passes validation for min length 8")
    }
}
