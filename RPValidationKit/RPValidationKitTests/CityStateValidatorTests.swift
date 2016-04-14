//
//  CityStateValidatorTests.swift
//  RPValidationKit
//
//  Created by Jeremy Fox on 4/14/16.
//  Copyright © 2016 Rentpath. All rights reserved.
//

import XCTest
@testable import RPValidationKit

class CityStateValidatorTests: XCTestCase {

    func testValidationPassesForValidCityStateOne() {
        let validator = CityStateValidator()
        XCTAssertTrue(validator.validate("atlanta, ga"))
    }
    
    func testValidationPassesForValidCityStateTwo() {
        let validator = CityStateValidator()
        XCTAssertTrue(validator.validate("Atlanta, GA"))
    }
    
    func testValidationPassesForValidCityStateThree() {
        let validator = CityStateValidator()
        XCTAssertTrue(validator.validate("los angeles, ca"))
    }
    
    func testValidationFailsForInvalidCityStateOne() {
        let validator = CityStateValidator()
        XCTAssertFalse(validator.validate("atlanta ga"))
    }
    
    func testValidationFailsForInvalidCityStateTwo() {
        let validator = CityStateValidator()
        XCTAssertFalse(validator.validate("atlantaga"))
    }
    
    func testValidationFailsForEmptyCityStateOne() {
        let validator = CityStateValidator()
        XCTAssertFalse(validator.validate(" "))
    }
    
    func testValidationFailsForEmptyCityStateTwo() {
        let validator = CityStateValidator()
        XCTAssertFalse(validator.validate(""))
    }
    
    func testPerformanceExample() {
        let validator = CityStateValidator()
        self.measureBlock {
            validator.validate("123 main st")
        }
    }

}
