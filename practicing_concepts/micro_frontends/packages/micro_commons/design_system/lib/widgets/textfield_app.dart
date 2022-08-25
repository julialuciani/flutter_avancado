import 'package:flutter/material.dart';

class TextFieldApp extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final String textfieldKey;
  final FocusNode? nextFocus;
  final FocusNode? nowFocus;
  final dynamic validate;
  final dynamic specificValidator;

  const TextFieldApp({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    required this.textfieldKey,
    this.nextFocus,
    this.nowFocus,
    this.validate,
    this.specificValidator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      focusNode: nowFocus,
      controller: controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: Colors.pink.shade100, width: 2),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        // enabled: false,
      ),
      key: Key(textfieldKey),
      onFieldSubmitted: (value) => nextFocus!.requestFocus(),
      validator: (value) {
        if (value!.isEmpty) {
          return "This field is mandatory";
        }
        return null;
      },
    );
  }
}
