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
Validator objects can be used individually to validate a string and can return either a Bool value for pass/fail or a Validation object that contains an isValid Bool along with an error message for failures.

```swift
// Bool value
let isValidEmail = EmailValidator().validate("hello@test.com")

// Validation
let emailValiation = EmailValidator().validate("Email", value: "hello@test.com")

if emailValidation.isValid {
  print("email is valid")
} else {
  print(emailValidation.errorMessage)
}
```

### Validating individual fields
Single text fields can also be validated by adding validators to a new property on a text field called `validators`

```swift
let emailField = UITextField()

// add a field name to the textfield for use in error messages
emailField.fieldName = "Email"

// make the name a required field and also check for a good email
emailField.validators = [RequiredValidator(), EmailValidator()]

// get a FieldValidation object from calling validate on a validatable
let emailValidation = emailField.validate()

if emailValidation.isValid {
  print("email is valid")
} else {
  // notice in this case the property for error messages is plural since there can be multiple validation failures on one field.
  print(emailValidation.errorMessages)
}
```

### Validating a form
Entire forms can be validated using the RPValidationManager class.

```swift
let firstNameField = UITextField()
firstNameField.fieldName = "First name"
firstNameField.text = "John"
firstNameField.validators = [RequiredValidator()]

let lastNameField = UITextField()
lastNameField.fieldName = "Last name"
lastNameField.text = "Smith"
lastNameField.validators = [RequiredValidator()]

let emailField = UITextField()
emailField.fieldName = "Email"
emailField.text = "hello@test.com"
emailField.validators = [RequiredValidator(), EmailValidator()]

let validationManager = RPValidationManager()
validationManager.addValidatable(firstNameField)
validationManager.addValidatable(lastNameField)
validationManager.addValidatable(emailField)

let result = validationManager.validate()

if result.isValid {
  print("Form is valid")
} else {
  print(result.errorMessages)
}
```

### Validating your own custom views
Any view can be validated as long as it conforms to the validatable protocol.

```swift
public protocol Validatable {

    func validatableName() -> String
    func validate() -> FieldValidation
    func showValid() -> Void
    func showInvalid() -> Void
    func resetValidation() -> Void
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
            textField.fieldName = "Some Required Field"
            textField.placeholder = "Required input"
            textField.validators = [RequiredValidator()]
        }
    }
}

extension CustomView: Validatable {

    func validate() -> FieldValidation {
        let result = textField.validate()

        if result.isValid {
            showValid()
        } else {
            showInvalid()
        }

        return result
    }

    func validatableName() -> String {
        return "Custom View"
    }

    func showValid() {
        backgroundColor = UIColor.greenColor()
    }

    func showInvalid() {
        backgroundColor = UIColor.redColor()
    }

    func resetValidation() {
        backgroundColor = UIColor.yellowColor()
    }
}
```

### Updating the display on views being validated
When validating custom views you can directly implement code in the showValid(), showInvalid(), and resetValidation() methods required by the Validatable protocol. For textviews you can provide closures to the textField to make updates. In the example below the background color of the textfield is changed based on whether or not validation has passed.

```swift

let emailField = UITextField()
emailField.fieldName = "Email"
emailField.text = "hello@test.com"
emailField.validators = [RequiredValidator(), EmailValidator()]
emailTextField.validHandler = { [unowned self] in
    self.emailTextField.backgroundColor = UIColor.greenColor()
}
emailTextField.invalidHandler = { [unowned self] in
    self.emailTextField.backgroundColor = UIColor.redColor()
}
emailTextField.resetHandler = { [unowned self] in
    self.emailTextField.backgroundColor = UIColor.whiteColor()
}

```

Also if validating a large number of fields using the RPValidationManager, there is a property called fields that stores all the validatables that failed validation.

```swift

let result = validationManager.validate()

if result.isValid {
  print("Form is valid")
} else {
  for field in result.fields {
    if let _field = field as? UITextField {
      _field.backgroundColor = UIColor.blackColor()
    }
  }
}

```


Authors
-------
If you are having issue with this library, or would like to recommend improvements, here is a list of authors who built & maintain this library.
* Chris Rebel
* ...
