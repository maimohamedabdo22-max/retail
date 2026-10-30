import 'package:flutter/material.dart';

class Validat extends StatelessWidget {
  Validat({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 55,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, color: Colors.white),
            ),
            CircleAvatar(
              backgroundColor: Colors.green,

              child: Icon(Icons.check, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
