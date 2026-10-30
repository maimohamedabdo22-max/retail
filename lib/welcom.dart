import 'package:flutter/material.dart';
import 'package:retail/login/signin.dart';
import 'package:retail/sign%20up/signUp_screen.dart';

class Welcom extends StatelessWidget {
  const Welcom({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            SizedBox(height: 100),
            Image.asset("assets/images/welcom.png", height: 365),
            SizedBox(height: 70),
            Text(
              "Welcome to our app",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight(400),
                color: Color(0xff7F4E1D),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "     Shop online and get groceries\n delivered from stores to your home\n in as fast as 1 hour .",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight(400),
                color: Color(0xff7F4E1D),
              ),
            ),
            SizedBox(height: 51),
            ElevatedButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => SignUp()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffFF5E00),
                fixedSize: Size.fromHeight(50),
              ),

              child: Text(
                "Sign Up",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight(400),
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => Signin()));
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size.fromHeight(50),
                side: BorderSide(color: Color(0xffFF5E00)),
              ),
              child: Text(
                "Sign In",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight(400),
                  color: Color(0xffFF5E00),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
