import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const primaryColor = Color(0xFF4b8d67);
const secondaryColor = Color(0xFF009831);
const bgColor = Color(0xFF212332);

const defaultPadding = 16.0;

final moneyformatter = NumberFormat('##,###');

show(context, String msg) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(msg)));
}

double setAmount(String amtIn) {
  return double.parse(amtIn.replaceAll('₦', '').replaceAll(',', ''));
}
