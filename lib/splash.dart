import 'package:flutter/material.dart';
import 'package:retail/welcom.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => Welcom()));
            },

            child: Image.asset("assets/images/splash.png"),
          ),
        ],
      ),
    );
  }
}
