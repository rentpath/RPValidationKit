//
//  StreetAddressValidator.swift
//  RPValidationKit
//
//  Created by Jeremy Fox on 4/14/16.
//  Copyright © 2016 Rentpath. All rights reserved.
//

public struct StreetAddressValidator {
    
    let STREET_REGEX = "^\\d{1,}(\\s{1}\\w{1,})(\\s{1}?\\w{1,})+$"
    
    public func validate(address: String) -> Bool {
        let trimmedAddress = address.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        if trimmedAddress.characters.count == 0 {
            return false
        }
        
        guard let range = address.rangeOfString(STREET_REGEX, options:.RegularExpressionSearch) else {
            return false
        }
        
        let distance = range.startIndex.distanceTo(range.endIndex)
        
        return distance > 0
    }
    
}
