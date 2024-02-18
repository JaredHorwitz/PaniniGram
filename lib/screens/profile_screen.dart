import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Card(
              child: SizedBox(
            height: 50,
            width: 200,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Firstname Lastname'),
                ),
                Icon(Icons.person)
              ],
            ),
          )),
        )
      ],
    );
  }
}
