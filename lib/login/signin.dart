import 'package:flutter/material.dart';
import 'package:retail/core/widgets/custom_app_failed.dart';
import 'package:retail/core/widgets/custom_button.dart';
import 'package:retail/core/widgets/navbar.dart';
import 'package:retail/sign%20up/signUp_screen.dart';

class Signin extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  Signin({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Sign In",
          style: TextStyle(
            color: Color(0xffFF5E00),
            fontSize: 24,
            fontWeight: FontWeight(400),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Color(0xffFF5E00)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset("assets/images/signin.png", height: 272),
                SizedBox(height: 64),
                Text(
                  "Enter your Email and\npassword to access your account",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight(400),
                    color: Color(0xff6D3805),
                  ),
                ),
                SizedBox(height: 18),
                CustomAppFailed(
                  text: "Email",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Pleas enter your email";
                    }
                    if (!value.contains("@") || !value.contains(".com")) {
                      return "Enter a valid email";
                    }
                    if (!emails.contains(value.trim().toLowerCase())) {
                      return 'Email not found';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 18),
                CustomAppFailed(
                  text: "Password",
                  SIcon: Icon(Icons.remove_red_eye),
                ),
                SizedBox(height: 9),
                Text(
                  "Forgote Password",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: Color(0xffFF5E00),
                    fontSize: 14,
                    fontWeight: FontWeight(400),
                  ),
                ),
                SizedBox(height: 32),
                CustomButton(
                  text: 'Sign in',
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Navbar()),
                    );
                  },
                ),
                SizedBox(height: 13),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account?",
                      style: TextStyle(
                        color: Color(0xff7F4E1D),
                        fontSize: 16,
                        fontWeight: FontWeight(400),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => SignUp()),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Color(0xffFF5E00),
                          fontSize: 16,
                          fontWeight: FontWeight(400),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
