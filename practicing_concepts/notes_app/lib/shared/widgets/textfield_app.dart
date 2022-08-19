import 'package:flutter/material.dart';

class TextFieldApp extends StatelessWidget {
  final String hintLabel;
  final String hintText;
  final TextEditingController controller;
  final String textfieldKey;

  const TextFieldApp({
    Key? key,
    required this.hintLabel,
    required this.hintText,
    required this.controller,
    required this.textfieldKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: hintLabel,
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
    );
  }
}
