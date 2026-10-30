import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
    required this.bgColor,
    required this.image,
    required this.text,
  });
  final int bgColor;
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Color(bgColor),
          radius: 45,
          child: Image.asset(image),
        ),
        SizedBox(height: 8),
        Text(
          text,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight(400),
            color: Color(0xff6D3805),
          ),
        ),
      ],
    );
  }
}
