import 'package:flutter/material.dart';

class ButtonDefaultWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const ButtonDefaultWidget({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
            side: BorderSide(color: Colors.grey.shade100, width: 2),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(title),
      ),
    );
  }
}
