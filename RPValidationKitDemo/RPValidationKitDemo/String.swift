//
//  String.swift
//  RPValidationKitDemo
//
//  Created by crebel on 3/28/16.
//  Copyright © 2016 Rentpath. All rights reserved.
//

import Foundation

enum CustomFormat {
    case none
    case phoneNumber
}

extension String {
    
    func format(_ customFormat: CustomFormat) -> String {
        switch customFormat {
        case .phoneNumber:  return phoneNumberFormat()
        default: return self
        }
    }
    
    fileprivate func phoneNumberFormat() -> String {
        var phoneDigits = digits()
        let digitCount = phoneDigits.characters.count
        
        if digitCount > 10 {
            phoneDigits = phoneDigits.substring(with: phoneDigits.startIndex..<phoneDigits.characters.index(phoneDigits.startIndex, offsetBy: 10))
        }
        
        if digitCount == 0 {
            return ""
        } else if digitCount < 3 {
            return "(" + phoneDigits + ")"
        } else if digitCount < 6 {
            let areaCode = phoneDigits.substring(with: phoneDigits.startIndex..<phoneDigits.characters.index(phoneDigits.startIndex, offsetBy: 3))
            let digits1 = phoneDigits.substring(with: phoneDigits.characters.index(phoneDigits.startIndex, offsetBy: 3)..<phoneDigits.endIndex)
            return "(" + areaCode + ") " + digits1
        } else {
            let areaCode = phoneDigits.substring(with: phoneDigits.startIndex..<phoneDigits.characters.index(phoneDigits.startIndex, offsetBy: 3))
            let digits1 = phoneDigits.substring(with: phoneDigits.characters.index(phoneDigits.startIndex, offsetBy: 3)..<phoneDigits.characters.index(phoneDigits.startIndex, offsetBy: 6))
            let digits2 = phoneDigits.substring(with: phoneDigits.characters.index(phoneDigits.startIndex, offsetBy: 6)..<phoneDigits.endIndex)
            return "(" + areaCode + ") " + digits1 + "-" + digits2
        }
    }
    
    func digits() -> String {
        return replacingOccurrences(of: "[^0-9]", with: "", options: NSString.CompareOptions.regularExpression)
    }
    
    func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }
    
    func substringWithRange(_ start: Int, end: Int) -> String {
        if (start < 0 || start > self.characters.count) {
            print("start index \(start) out of bounds")
            return ""
        } else if end < 0 || end > self.characters.count {
            print("end index \(end) out of bounds")
            return ""
        }
        
        return self.substring(with: self.characters.index(self.startIndex, offsetBy: start)..<self.characters.index(self.startIndex, offsetBy: end))
    }
    
    func substringWithRange(_ start: Int, location: Int) -> String {
        if (start < 0 || start > self.characters.count) {
            print("start index \(start) out of bounds")
            return ""
        } else if location < 0 || start + location > self.characters.count {
            print("end index \(start + location) out of bounds")
            return ""
        }
        let range = self.characters.index(self.startIndex, offsetBy: start)..<self.characters.index(self.startIndex, offsetBy: start + location)
        return self.substring(with: range)
    }
}
