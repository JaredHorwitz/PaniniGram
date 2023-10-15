import 'package:flutter/material.dart';

class BottomDialog extends StatelessWidget {
  const BottomDialog({super.key, required this.success});
  final bool success;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AlertDialog(
          backgroundColor: (success) ? Colors.green : Colors.black,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                (success) ? 'Success!' : 'Try again',
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
