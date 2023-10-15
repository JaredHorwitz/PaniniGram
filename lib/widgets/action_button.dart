import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    required this.text,
    required this.onPressed,
    super.key,
  });

  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          width: 150,
          height: 50,
          child: OutlinedButton(
              style: OutlinedButton.styleFrom(foregroundColor: Colors.black),
              onPressed: onPressed,
              child: Text(text))),
    );
  }
}
