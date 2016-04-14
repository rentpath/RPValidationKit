//
//  ZipCodeValidator.swift
//  RPValidationKit
//
//  Created by Jeremy Fox on 4/14/16.
//  Copyright © 2016 Rentpath. All rights reserved.
//

public struct ZipCodeValidator {
    
    let ZIP_REGEX = "^[0-9]{5}(-([0-9]{1,4}))?$"
    
    public func validate(zipCode: String) -> Bool {
        
        // Check for an invalid zip in the format of 999999
        let reversedSearchTerm = Array(zipCode.characters.reverse()).reduce("") { $0 + "\($1)" }
        if reversedSearchTerm == zipCode {
            return false
        }
        
        let zipRegex: NSRegularExpression!
        do {
            zipRegex = try NSRegularExpression(pattern: ZIP_REGEX, options: [.CaseInsensitive, .AnchorsMatchLines])
        } catch let error as NSError {
            print("Error validating zipcode. Error: \(error.localizedDescription)")
            return false
        }
        let matches = zipRegex.numberOfMatchesInString(zipCode, options: NSMatchingOptions.ReportCompletion, range: NSMakeRange(0, zipCode.characters.count))
        
        return matches != 0
    }
    
}
