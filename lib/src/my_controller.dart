import 'package:flutter/material.dart';

class MyController {
  MyController() {
    onInit();
  }
  final busy = ValueNotifier(false);
  onInit() {
    // debugPrint('Oninit Controller');
  }
}
