# RPValidationKit
Library used to validate user inputted text

Getting Started
---------------
1. Clone to your local machine: `git clone git@github.com:rentapth/RPValidationKit`
2. Build and Test the project to make sure everything is good-to-go

Installation
------------
### Carthage
To install this libaray via Cathage, just add the following to your `Cartfile`:
```bash
github "RentPath/RPValidationKit" ~> 1.0
```

### Submodule
To install this library via submodule, just do the following:
```bash
git submodule add git@github.com/rentpath/RPValidationKit
```

### Directly inlcude source
Don't! This is not a good idea since it makes updating dependencies much more difficult and time consuming. Use one of the options above.

Tests:
------
This library makes heavy use of testing to ensure stable and maintainable code. Please make sure you run the tests often, especially before comitting or creating PR's. To run the tests simply hold in the `command` key and press `u`.

If there are ever failing tests, first stash all of your local changes and run the tests again. This will verify if you made a changed that caused a test failure. There can be two possible outcomes, which are outlined below:

1. There are still failing tests after staging all of your local changes. If this happens, please investigate which commit introduced the failing test(s) and report that to the auther of that commit to address the failing test(s).

2. All tests pass after you stage all your local changes. This means you've introduced code that caused a failing test(s). Please investigate what test(s) are failing and look at what you changed that caused the test failures. If needed, get with the auther of the test and determine if your changes should be kept and the test should be updated. If not, then you'll need to revert your changes so that the test(s) pass and continue your work with a different implementation that doesn't result in test failures.

How It's Used
-------------
### Using stand alone validator objects
Validator objects can be used individually to validate a string and can return either a Bool value for pass/fail or a Validation enum that returns either success or an error with an associated string.

```swift
// Bool value
let isValidEmail = EmailValidator().validate("hello@test.com")

// Validation
let emailValiation = EmailValidator().validateField("Email", value: "hello@test.com")

switch emailValidation {
  case .Valid: print("email is valid")
  case .Error(let message): print(message)
}

```

### Validating individual fields
Single text fields can also be validated by adding validators to a new property on a text field called `validators`

```swift
let emailField = UITextField()

// add a validatable name to the textfield for use in error messages
emailField.validatableName = "Email"

// make the name a required field and also check for a good email
emailField.validators = [RequiredValidator(), EmailValidator()]

// get a ValidationResult object from calling validate on a validatable
let emailValidationResult = emailField.validate()

if emailValidationResult.isValid {
  print("email is valid")
} else {
  print(emailValidationResult.errorMessages)
}
```

### Validating a form
Entire forms can be validated using the RPValidationManager class.

```swift
let firstNameField = UITextField()
firstNameField.validatableName = "First name"
firstNameField.text = "John"
firstNameField.validators = [RequiredValidator()]

let lastNameField = UITextField()
lastNameField.validatableName = "Last name"
lastNameField.text = "Smith"
lastNameField.validators = [RequiredValidator()]

let emailField = UITextField()
emailField.validatableName = "Email"
emailField.text = "hello@test.com"
emailField.validators = [RequiredValidator(), EmailValidator()]

let validationManager = RPValidationManager()
validationManager.add(firstNameField)
validationManager.add(lastNameField)
validationManager.add(emailField)

let result = validationManager.validate()

if result.isValid {
  print("Form is valid")
} else {
  print(result.errorMessages)
}
```

### Validating your own custom views
Any view can be validated as long as it conforms to the validatable protocol and implements the validate function.

```swift
public protocol Validatable {
  ...
  func validate() -> ValidationResult
}
```

Here is an example of a custom view that is implementing the validatable protocol.

```swift
import UIKit
import RPValidationKit

class CustomView: UIView {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField! {
        didSet {
            textField.validatableName = "Some Required Field"
            textField.placeholder = "Required input"
            textField.validators = [RequiredValidator()]
        }
    }
}

extension CustomView: Validatable {

  func validate() -> ValidationResult {
      let result = textField.validate()

      if result.isValid {
          backgroundColor = UIColor.greenColor().colorWithAlphaComponent(0.1)
      } else {
          backgroundColor = UIColor.redColor().colorWithAlphaComponent(0.1)
      }

      return textField.validate()
  }
}
```

### Updating the display on views being validated
A validation manager has fields for valid and invalid fields. Asking for either will run the validation functions.  You can use these arrays to adjust the display.

```swift

let validColor = UIColor.greenColor().colorWithAlphaComponent(0.1)
let errorColor = UIColor.redColor().colorWithAlphaComponent(0.1)

for field in validationManager.validFields {
  if let _field = field as? UIView {
    _field.backgroundColor = validColor
  }
}

for field in validationManager.invalidFields {
  if let _field = field as? UIView {
    _field.backgroundColor = errorColor
  }
}

```

Authors
-------
If you are having issue with this library, or would like to recommend improvements, here is a list of authors who built & maintain this library.
* Chris Rebel
* ...
