import 'package:flutter/material.dart';

class TextFieldAppConfirmPassword extends StatefulWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final TextEditingController? controllerConfirm;
  final String textfieldKey;
  final FocusNode? nextFocus;
  final FocusNode? nowFocus;
  final dynamic validate;
  final dynamic specificValidator;
   bool obscure;
  IconData? icon;

  TextFieldAppConfirmPassword({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.controllerConfirm,
    required this.textfieldKey,
    this.nextFocus,
    this.nowFocus,
    this.validate,
    this.specificValidator,
    this.obscure = true,
    this.icon,
  }) : super(key: key);

  @override
  State<TextFieldAppConfirmPassword> createState() => _TextFieldAppConfirmPasswordState();
}
class _TextFieldAppConfirmPasswordState extends State<TextFieldAppConfirmPassword> {
  void changeVisibility() {
    if (widget.icon == Icons.visibility) {
      widget.icon = Icons.visibility_off;
    } else {
      widget.icon = Icons.visibility;
    }
    setState(() {
      widget.obscure = !widget.obscure;
    });
  }


  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscure,
      autofocus: true,
      focusNode: widget.nowFocus,
      controller: widget.controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
       suffixIcon: IconButton(onPressed: () {
          changeVisibility();
          setState(() {
            
          });
        }, icon: Icon(widget.icon)),
        labelText: widget.labelText,
        hintText: widget.hintText,

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: Colors.pink.shade100, width: 2),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        // enabled: false,
      ),
      key: Key(widget.textfieldKey),
      onFieldSubmitted: (value) => widget.nextFocus!.requestFocus(),
      validator: (value) {
        if (value!.isEmpty) {
          return "This field is mandatory";
        } else if (widget.controller.text != widget.controllerConfirm!.text) {
          return "The passwords don't match";
        }
        return null;
      },
    );
  }
}


