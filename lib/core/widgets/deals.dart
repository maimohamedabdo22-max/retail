import 'package:flutter/material.dart';

class Deals extends StatelessWidget {
  const Deals({
    super.key,
    required this.imagesofitem,
    required this.name,
    required this.quantity,
    required this.price,
  });
  final String imagesofitem;
  final String name;
  final String quantity;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      width: 155,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Center(child: Image.asset(imagesofitem))),
          SizedBox(height: 15),
          Text(
            name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight(600),
              color: Color(0xff6D3805),
            ),
          ),
          Text(
            quantity,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight(400),
              color: Color(0xff929292),
            ),
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                price,
                style: TextStyle(
                  color: Color(0xffFF5E00),
                  fontSize: 20,
                  fontWeight: FontWeight(400),
                ),
              ),
              CircleAvatar(
                backgroundColor: Color(0xff3AA14C),
                child: Icon(Icons.add, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
