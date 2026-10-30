import 'package:flutter/material.dart';
import 'package:retail/core/widgets/count.dart';

import 'package:retail/home/detalis.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.imageOfItem,
    required this.name,
    required this.quantity,
    required this.price,
    required this.scale,
  });
  final String imageOfItem;
  final String name;
  final String quantity;
  final String price;
  final String scale;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),

      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,

        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Detalis(
                  image: imageOfItem,
                  namefruit: name,
                  pricefruit: price,
                ),
              ),
            );
          },
          child: Align(
            alignment: AlignmentGeometry.centerEnd,
            child: Icon(Icons.delete, color: Colors.white),
          ),
        ),
      ),
      child: Container(
        height: 98,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 1, color: Color(0xffF2EDE8)),
            top: BorderSide(width: 1, color: Color(0xffF2EDE8)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(imageOfItem, height: 65, width: 65),
            ),

            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      textAlign: TextAlign.start,
                      name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff6D3805),
                      ),
                    ),

                    Row(
                      children: [
                        Count(),
                        Spacer(),
                        Text(
                          price,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff6D3805),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
