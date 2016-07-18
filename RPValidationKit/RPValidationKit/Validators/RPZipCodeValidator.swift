/*
 * Copyright (c) 2016 RentPath, LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

public class RPZipCodeValidator: RPValidator {
    
    let ZIP_REGEX = "^[0-9]{5}(-([0-9]{1,4}))?$"
    
    public override func getType() -> String {
        return "zipcode"
    }
    
    public override func validate(zipCode: String) -> Bool {
        
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
    
    public override func validateField(fieldName: String, value: String) -> RPValidation {
        if validate(value) {
            return RPValidation.Valid
        } else {
            return RPValidation.Error(message: "\(fieldName) is not a valid zip code")
        }
    }
    
}
