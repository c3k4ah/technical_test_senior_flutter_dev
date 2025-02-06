extension StringExtension on String {
  /// Checks if string is a valid username.
  bool get isUsername => hasMatch(this, r'^[a-zA-ZÀ-ÿ\s-]{2,30}$');

  /// Checks if string is email.
  bool get isEmail => hasMatch(this,
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  /// Checks if string is phone number.
  bool get isPhoneNumber {
    if (length > 16 || length < 9) {
      return false;
    }
    return hasMatch(this, r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
  }

  /// Check if string is a postal code
  bool get isZipCode => hasMatch(this, r'^[0-9]{3,}$');

  /* Password with at least 8 characters, 
  at least 1 special, at least 1 number, 
  at least 1 uppercase, at least 1 lowercase  
  */

  bool get isCorrectUsername => hasMatch(
      this, r'^(^(?=.{5,19}$)(?=[A-Za-z])[A-Za-z0-9]+(?:\.[A-Za-z0-9]+)*$)$');

  bool get isCorrectPassword => hasMatch(this,
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$#!%*?&€£])[A-Za-z\d@#$!%*?&€£]{8,}$');

  bool get atLeastOneLowercase => hasMatch(this, r'[a-z]');

  bool get atLeastOneUppercase => hasMatch(this, r'[A-Z]');

  bool get atLeastOneDigit => hasMatch(this, r'\d');

  bool get atLeastSixCharacters => hasMatch(this, r'^.{6,}$');

  bool get noSpecialCharacters => hasMatch(this, r'^[a-zA-Z0-9]*$');

  bool get atLeastEightCharacters => hasMatch(this, r'^.{8,}$');

  bool get atLeastOneSpecialCharacter => hasMatch(this, r'[^a-zA-Z0-9]');

  //Convert a string from textfield to int even it's an empty field
  int parseToIntEvenEmpty() {
    return this != '' ? int.parse(this) : 0;
  }
}

bool hasMatch(String? value, String pattern) {
  return (value == null) ? false : RegExp(pattern).hasMatch(value);
}
