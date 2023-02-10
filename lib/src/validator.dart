import 'package:the_util/the_util.dart';

abstract class Validator {
  // bool isValidName(String? value);
  String? validateName(String? value);

  // bool _isValidEmail(String? value);
  String? validateEmail(String? value);

  // bool isValidPhone(String? value);
  String? validatePhone(String? value);

  String? validatePassword(String value);
  String? validateConfrimPassword(String? value, String? value2);

  String? validateAmount(String value);

  String? validateNotEmpty(String value);
}

class DefaultValidator implements Validator {
  static const acceptableVale = 3;

  // @override
  bool _isValidEmail(String? value) {
    return (value == null || !value.isValidEmail()) ? false : true;
  }

  @override
  String? validateEmail(String? value) {
    return !_isValidEmail(value) ? "Enter valid email address" : null;
  }

  bool _isValidName(String? value) {
    return (value == null || value.length < acceptableVale) ? false : true;
  }

  @override
  String? validateName(String? value) {
    return !_isValidName(value) ? 'Enter valid name' : null;
  }

  // @override
  bool _isValidPhone(String? value) {
    // return (value == null || value.length != 10) ? false : true;
    return (value == null || !value.isValidPhone()) ? false : true;
  }

  @override
  String? validatePhone(String? value) {
    if (!_isValidPhone(value)) {
      return 'Mobile Number must be of 10 digit';
    } else {
      return null;
    }
  }

  @override
  String? validatePassword(String? value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value == null) {
      return 'Please enter password';
    }
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid password';
      } else {
        return null;
      }
    }
  }

  @override
  String? validateConfrimPassword(String? value, String? value2) {
    if (value == null || value2 == null) {
      return 'Please enter password';
    }
    if (value != value2) {
      return 'Password does not match';
    } else {
      return null;
    }
  }

  bool _isNumeric(String? s) {
    if (s == null) {
      return false;
    }
    final res = double.tryParse(s);
    if (!res!.isNaN) {
      return true;
    }
    return false;
  }

  @override
  String? validateAmount(String? value) {
    if (value == null) {
      return 'Please enter amount';
    }
    if (!_isNumeric(value)) {
      return 'Please enter amount';
    } else {
      return null;
    }
  }

  @override
  String? validateNotEmpty(String? value) {
    if (value!.trim().isEmpty) {
      return 'Field cannot be empty';
    }
    return null;
  }

  String? validateNonNull(String? value) {
    if (value == null) {
      return 'Please select option.';
    }
    return null;
  }
}
