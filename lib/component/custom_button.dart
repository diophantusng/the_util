import 'package:flutter/material.dart';

import '../constants.dart';
import '../responsive.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {Key? key,
      required this.labelText,
      this.color = Colors.blue,
      this.onPressed})
      : super(key: key);

  CustomButton.cancel(
      {Key? key,
      this.labelText = 'Cancel',
      this.color = Colors.grey,
      this.onPressed})
      : super(key: key);

  final String labelText;
  final Color color;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: TextButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(
          horizontal: defaultPadding * 1.5,
          vertical: defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
        ),
      ),
      onPressed: onPressed,
      child: Text(labelText),
    );
  }
}
