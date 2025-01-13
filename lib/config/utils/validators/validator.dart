import 'dart:developer';

class Validators {
  static String? validateField(String? value, context) {
    if (value == null || value.isEmpty) {
      return "required";
    }
    return null;
  }

  static String? validateDropdown(var value, context) {
    if (value == null) {
      return "required";
    }
    return null;
  }

  static String? validateOTP(String value, context) {
    if (value.isEmpty) {
      return "OTP is required";
    } else if (value.length < 4) {
      return "Incorrect OTP";
    }
    return null;
  }

  static String? validateEmail(value, context) {
    Pattern pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regex = new RegExp(pattern as String);

    if (value.isEmpty) {
      return "required";
    } else if (!regex.hasMatch(value)) {
      return "Incorrect email entered";
    }
    return null;
  }

  static String? validatePassword(String? value, context) {
    if (value == null || value.isEmpty) {
      return "required";
    } else if (!(value.length >= 8)) {
      return "Minimum 8 characters required";
    }
    return null;
  }

  static String? validatePhoneNumber(String value, context) {
    log(value.toString());
    Pattern pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regex = new RegExp(pattern as String);
    if (value.isEmpty) {
      return "required";
    } else if (!regex.hasMatch(value)) {
      return "Incorrect phone number entered";
    }
    return null;
  }
}