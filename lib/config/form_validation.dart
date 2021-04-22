class FormValidator {
  static String validateInputField(String inputFiled, String name) {
    if (inputFiled.isEmpty) return "Please complete the $name field!";
    if (inputFiled.length < 2) return '$name field must contain at least 2 characters!';
    return null;
  }

  static String validateNumberField(String inputFiled, String name) {
    if (inputFiled.length == 0) return "Please complete the $name field!";
    String number = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(number);
    if (!regExp.hasMatch(inputFiled)) {
      return 'Please enter a valid $name number!';
    }
    return null;
  }

  static String validateEmail(String email) {
    if (email.isEmpty) return "Please enter an email address!";
    Pattern pattern = r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(email)) {
      return "Please enter a valid email address.";
    }
    return null;
  }

  static String validatePassword({String value, int passNumber = 8}) {
    if (value.isEmpty) return 'Please complete the password field.';
    if (value.length < passNumber) return 'Password must contain at least $passNumber characters.';
    return null;
  }

  static String validatePasswordConfirmation(String confirmPassword, String password) {
    if (confirmPassword.isEmpty) return 'Please complete the password field.';
    if (confirmPassword != password) return 'The passwords do not match.';
    return null;
  }
}
