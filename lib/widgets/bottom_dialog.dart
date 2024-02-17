import 'package:flutter/material.dart';

class TopDialog extends StatelessWidget {
  const TopDialog({super.key, required this.success});
  final bool success;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
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
