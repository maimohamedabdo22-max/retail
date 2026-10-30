import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  final IconData starticon;
  final String text;
  final Widget? endIcon;

  const ProfileItem({
    super.key,
    required this.starticon,
    this.endIcon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: Icon(starticon, size: 30, color: Color(0xff804F1E)),
      title: Text(
        text,
        style: TextStyle(
          color: Color(0xff804F1E),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing:
          endIcon ?? Icon(Icons.arrow_forward_ios, color: Color(0xff804F1E)),
    );
  }
}
