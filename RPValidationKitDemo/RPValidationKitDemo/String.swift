//
//  String.swift
//  RPValidationKitDemo
//
//  Created by crebel on 3/28/16.
//  Copyright © 2016 Rentpath. All rights reserved.
//

import Foundation

enum CustomFormat {
    case None
    case PhoneNumber
}

extension String {
    
    func format(customFormat: CustomFormat) -> String {
        switch customFormat {
        case .PhoneNumber:  return phoneNumberFormat()
        default: return self
        }
    }
    
    private func phoneNumberFormat() -> String {
        var phoneDigits = digits()
        let digitCount = phoneDigits.characters.count
        
        if digitCount > 10 {
            phoneDigits = phoneDigits.substringWithRange(phoneDigits.startIndex..<phoneDigits.startIndex.advancedBy(10))
        }
        
        if digitCount == 0 {
            return ""
        } else if digitCount < 3 {
            return "(" + phoneDigits + ")"
        } else if digitCount < 6 {
            let areaCode = phoneDigits.substringWithRange(phoneDigits.startIndex..<phoneDigits.startIndex.advancedBy(3))
            let digits1 = phoneDigits.substringWithRange(phoneDigits.startIndex.advancedBy(3)..<phoneDigits.endIndex)
            return "(" + areaCode + ") " + digits1
        } else {
            let areaCode = phoneDigits.substringWithRange(phoneDigits.startIndex..<phoneDigits.startIndex.advancedBy(3))
            let digits1 = phoneDigits.substringWithRange(phoneDigits.startIndex.advancedBy(3)..<phoneDigits.startIndex.advancedBy(6))
            let digits2 = phoneDigits.substringWithRange(phoneDigits.startIndex.advancedBy(6)..<phoneDigits.endIndex)
            return "(" + areaCode + ") " + digits1 + "-" + digits2
        }
    }
    
    func digits() -> String {
        return stringByReplacingOccurrencesOfString("[^0-9]", withString: "", options: NSStringCompareOptions.RegularExpressionSearch, range: self.startIndex..<self.endIndex)
    }
    
    func toDouble() -> Double? {
        return NSNumberFormatter().numberFromString(self)?.doubleValue
    }
    
    func substringWithRange(start: Int, end: Int) -> String {
        if (start < 0 || start > self.characters.count) {
            print("start index \(start) out of bounds")
            return ""
        } else if end < 0 || end > self.characters.count {
            print("end index \(end) out of bounds")
            return ""
        }
        
        return self.substringWithRange(self.startIndex.advancedBy(start)..<self.startIndex.advancedBy(end))
    }
    
    func substringWithRange(start: Int, location: Int) -> String {
        if (start < 0 || start > self.characters.count) {
            print("start index \(start) out of bounds")
            return ""
        } else if location < 0 || start + location > self.characters.count {
            print("end index \(start + location) out of bounds")
            return ""
        }
        let range = self.startIndex.advancedBy(start)..<self.startIndex.advancedBy(start + location)
        return self.substringWithRange(range)
    }
}
