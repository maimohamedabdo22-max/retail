import 'package:flutter/material.dart';

class Order extends StatelessWidget {
  final String Ordernum;
  final String OrderStutes;
  final String data;
  final String price;

  const Order({
    super.key,
    required this.Ordernum,
    required this.OrderStutes,
    required this.data,
    required this.price,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(width: 1, color: Color(0xffF7F3F0))),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/Group.png"),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Ordernum,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff804F1E),
                ),
              ),
              SizedBox(height: 4),
              Text(
                OrderStutes,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: OrderStutes == "Cancelled"
                      ? Colors.red
                      : Color(0xff5EC401),
                ),
              ),
              SizedBox(height: 5),
              Text(
                data,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight(400),
                  color: Color(0xff804F1E),
                ),
              ),
            ],
          ),
          Spacer(),
          Text(
            textAlign: TextAlign.end,
            price,
            style: TextStyle(
              color: Color(0xffF37A20),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
