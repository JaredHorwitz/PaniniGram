import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    super.key,
  });

  final String text;
  final Function()? onPressed;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          width: 150,
          height: 50,
          child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: backgroundColor),
              onPressed: onPressed,
              child: Text(text))),
    );
  }
}
