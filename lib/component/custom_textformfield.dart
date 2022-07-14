import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {Key? key,
      required this.labelText,
      this.initialValue = '',
      this.enabled = true,
      this.obscureText = false,
      this.onChanged,
      this.validator,
      this.autovalidateMode,
      this.autocorrect = false,
      this.enableSuggestions = false,
      this.inputFormatters,
      this.width = 350,
      this.maxLines = 1,
      this.minLines = 1})
      : super(key: key);

  final String labelText;
  final String initialValue;
  final bool enabled;
  final bool obscureText;
  void Function(String)? onChanged;
  String? Function(String?)? validator;
  List<TextInputFormatter>? inputFormatters;
  double? width;
  int? maxLines;
  int? minLines;
  AutovalidateMode? autovalidateMode;
  bool enableSuggestions;
  bool autocorrect;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: width,
        child: TextFormField(
          maxLines: maxLines, // <-- SEE HERE
          minLines: minLines, // <-- SEE HERE
          inputFormatters: inputFormatters,
          autovalidateMode: autovalidateMode,
          enableSuggestions: enableSuggestions,
          validator: validator,
          onChanged: onChanged,
          obscureText: obscureText,
          initialValue: initialValue,
          enabled: enabled,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.only(left: 10.0, top: 15.0, bottom: 15.0),
            labelText: labelText,
            // errorText: 'Error message',
            border: const OutlineInputBorder(),
            // suffixIcon: Icon(
            //   Icons.error,
            // ),
          ),
          style: const TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
