import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:retail/core/widgets/custom_button.dart';

class Detalis extends StatefulWidget {
  Detalis({
    super.key,
    required this.image,
    required this.namefruit,
    required this.pricefruit,
  });
  final String image;
  final String namefruit;
  final String pricefruit;

  @override
  State<Detalis> createState() => _DetalisState();
}

class _DetalisState extends State<Detalis> {
  bool isFavorite = false;

  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text(
          " ${widget.namefruit} Detalis",
          style: TextStyle(color: Color(0xffFF5E00)),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 70),
              Image.asset(widget.image, width: 210, height: 145),
              SizedBox(height: 144),
              Text(
                widget.namefruit,
                style: TextStyle(
                  color: Color(0xff6D3805),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                widget.pricefruit,
                style: TextStyle(
                  color: Color(0xff6D3805),
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Golden Ripe Alphonsa mangoes delivered to your\n house in the most hygenic way ever... Best for eating \nplain but can also be made into shakes and cakes.",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight(400),
                  color: Color(0xff6D3805),
                ),
              ),
              SizedBox(height: 59),
              Row(
                children: [
                  Container(
                    width: 286,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Color(0xffF4F4F4),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 20.5,
                          child: GestureDetector(
                            onTap: () {
                              if (quantity > 0) {
                                setState(() {
                                  quantity--;
                                });
                              }
                            },
                            child: Icon(
                              Icons.remove,
                              color: Color(0xff6D3805),
                              size: 24,
                            ),
                          ),
                        ),

                        SizedBox(width: 87),

                        Text(
                          "$quantity",
                          style: TextStyle(
                            color: Color(0xff6D3805),
                            fontSize: 24,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(width: 87),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 20.5,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                quantity++;
                              });
                            },
                            child: Center(
                              child: Icon(
                                Icons.add,
                                color: Color(0xff6D3805),
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 32),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 60),
              CustomButton(text: "Add to cart", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
