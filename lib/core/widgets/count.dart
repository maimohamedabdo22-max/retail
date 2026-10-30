import 'package:flutter/material.dart';

class Count extends StatefulWidget {
  const Count({super.key});

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  int quantity = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Color(0xffF4F4F4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 15,
            child: GestureDetector(
              onTap: () {
                if (quantity > 0) {
                  setState(() {
                    quantity--;
                  });
                }
              },
              child: Icon(Icons.remove, color: Color(0xff6D3805), size: 18),
            ),
          ),

          SizedBox(width: 8),

          Text(
            "$quantity",
            style: TextStyle(
              color: Color(0xff6D3805),
              fontSize: 18,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(width: 8),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 15,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  quantity++;
                });
              },
              child: Center(
                child: Icon(Icons.add, color: Color(0xff6D3805), size: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
