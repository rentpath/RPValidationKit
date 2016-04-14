//
//  CityStateValidator.swift
//  RPValidationKit
//
//  Created by Jeremy Fox on 4/14/16.
//  Copyright © 2016 Rentpath. All rights reserved.
//

public struct CityStateValidator {
    
    let CITY_STATE_REGEX = "^([^,]+),\\s?([A-Za-z]{2,})$"
    
    public func validate(cityState: String) -> Bool {
        
        let twoLetterRegex: NSRegularExpression!
        do {
            twoLetterRegex = try NSRegularExpression(pattern: CITY_STATE_REGEX, options: [.CaseInsensitive, .AnchorsMatchLines])
        } catch let error as NSError {
            print("Error validating city state. Error: \(error.localizedDescription)")
            return false
        }
        
        let matches = twoLetterRegex.numberOfMatchesInString(cityState, options: .ReportCompletion, range: NSMakeRange(0, cityState.utf16.count))
        
        return matches != 0
    }
    
}
