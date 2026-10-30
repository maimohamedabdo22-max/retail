import 'package:flutter/material.dart';
import 'package:retail/core/widgets/custom_button.dart';
import 'package:retail/core/widgets/navbar.dart';

List<String> emails = [];

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text(
          "Sign Up",
          style: TextStyle(
            color: Color(0xffFF5E00),
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xffFF5E00)),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),

          child: Form(
            key: _formKey,

            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset("assets/images/signup.png", height: 287),

                  const SizedBox(height: 14),

                  const Text(
                    "Please enter your information to\n create an account.",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff6D3805),
                    ),
                  ),

                  SizedBox(height: 36),

                  // Email
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,

                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: const TextStyle(
                        color: Color(0xffAC8E71),
                        fontSize: 16,
                      ),
                      filled: true,
                      fillColor: const Color(0xffF3F3F3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffF3F3F3)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffFF5E00)),
                      ),
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required";
                      }

                      if (!value.contains('@') || !value.contains('.')) {
                        return "Enter a valid email";
                      }

                      if (emails.contains(value.trim().toLowerCase())) {
                        return "Email already exists";
                      }

                      return null;
                    },

                    onSaved: (value) {
                      email = value!.trim().toLowerCase();
                    },
                  ),

                  SizedBox(height: 18),

                  // Password
                  TextFormField(
                    obscureText: true,

                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: const TextStyle(
                        color: Color(0xffAC8E71),
                        fontSize: 16,
                      ),
                      suffixIcon: const Icon(
                        Icons.remove_red_eye_outlined,
                        color: Color(0xffFF5E00),
                      ),
                      filled: true,
                      fillColor: const Color(0xffF3F3F3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffF3F3F3)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffFF5E00)),
                      ),
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      }

                      if (value.length < 8) {
                        return "Password must be at least 8 characters";
                      }

                      return null;
                    },

                    onSaved: (value) {
                      password = value!;
                    },
                  ),

                  SizedBox(height: 18),

                  // Confirm Password
                  TextFormField(
                    obscureText: true,

                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      hintStyle: const TextStyle(
                        color: Color(0xffAC8E71),
                        fontSize: 16,
                      ),
                      suffixIcon: const Icon(
                        Icons.remove_red_eye_outlined,
                        color: Color(0xffFF5E00),
                      ),
                      filled: true,
                      fillColor: const Color(0xffF3F3F3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffF3F3F3)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffFF5E00)),
                      ),
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please confirm your password";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 41),

                  CustomButton(
                    text: 'Sign Up',

                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        emails.add(email);

                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Navbar()),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
