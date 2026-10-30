import 'package:flutter/material.dart';
import 'package:retail/core/widgets/profile_item.dart';
import 'package:retail/welcom.dart';

class ProfaileScreen extends StatefulWidget {
  const ProfaileScreen({super.key});

  @override
  State<ProfaileScreen> createState() => _ProfaileScreenState();
}

class _ProfaileScreenState extends State<ProfaileScreen> {
  bool SwitchDefaultValue = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
            color: Color(0xffFF5E00),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileItem(starticon: Icons.person, text: 'Profaile'),
          ProfileItem(starticon: Icons.key, text: 'Change Password'),
          ProfileItem(starticon: Icons.credit_card_outlined, text: 'My Cards'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Text(
              "App Settings",
              style: TextStyle(
                color: Color(0xffFF5E00),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SwitchListTile(
            value: SwitchDefaultValue,

            activeTrackColor: Color(0xffFF5E00),
            secondary: Icon(
              Icons.notifications,
              color: Color(0xff804F1E),
              size: 24,
            ),
            title: Text(
              "Notification",
              style: TextStyle(
                color: Color(0xff804F1E),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            onChanged: (value) {
              setState(() {
                SwitchDefaultValue = value;
              });
            },
          ),

          ProfileItem(
            starticon: Icons.g_translate_rounded,
            text: 'Language',
            endIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "English",
                  style: TextStyle(
                    color: Color(0xff804F1E),
                    fontSize: 16,
                    fontWeight: FontWeight(400),
                  ),
                ),
                Icon(Icons.arrow_forward_ios, color: Color(0xff804F1E)),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Welcom()),
              );
            },
            child: ProfileItem(
              starticon: Icons.logout_rounded,
              text: 'logout',
              endIcon: SizedBox(),
            ),
          ),
        ],
      ),
    );
  }
}
