import 'package:intl/intl.dart';

extension StringExtension on String {
  String? capitalize() {
    if (isEmpty) {
      return '';
    }
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

extension PhoneValidator on String {
  bool isValidPhone() {
    return !RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(this);
  }
}

bool isNumeric(String s) {
  return double.tryParse(s) != null;
}

final moneyformatter = NumberFormat('##,###');
