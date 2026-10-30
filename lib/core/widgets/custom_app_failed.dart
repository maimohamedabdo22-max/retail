import 'package:flutter/material.dart';

class CustomAppFailed extends StatelessWidget {
  const CustomAppFailed({
    super.key,
    required this.text,
    this.SIcon,
    this.validator,
  });
  final String text;
  final Widget? SIcon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hint: Text(
          text,
          style: TextStyle(
            color: Color(0xffAC8E71),
            fontSize: 16,
            fontWeight: FontWeight(400),
          ),
        ),
        suffixIcon: SIcon,
        filled: true,
        fillColor: Color(0xffF3F3F3),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffF3F3F3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffFF5E00)),
        ),
      ),
      validator: validator,
    );
  }
}
