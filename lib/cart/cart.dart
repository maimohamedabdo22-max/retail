import 'package:flutter/material.dart';
import 'package:retail/core/widgets/cart_item.dart';
import 'package:retail/core/widgets/custom_button.dart';
import 'package:retail/home/detalis.dart';

class Cart extends StatelessWidget {
  Cart({super.key});
  List<String> imageOfItem = [
    "assets/images/apple.png",
    "assets/images/banana.png",
    "assets/images/Avocado.png",
    "assets/images/salmon.png",
    "assets/images/apple.png",
    "assets/images/banana.png",
    "assets/images/Avocado.png",
    "assets/images/salmon.png",
  ];
  List<String> name = [
    "Red Apple",
    "Orginal Banana",
    "Avocado Bowl",
    "Salmon",
    "Red Apple",
    "Orginal Banana",
    "Avocado Bowl",
    "Salmon",
  ];
  List<String> quantity = ["2", "2", "1", "2", "2", "2", "1", "2"];
  List<String> price = [
    "\$4.99",
    "\$5.99",
    "\$24",
    "\$50",
    "\$4.99",
    "\$5.99",
    "\$24",
    "\$50",
  ];
  List<String> scale = ["kg", "kg", "st", "kg", "kg", "kg", "st", "kg"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: TextStyle(
            color: Color(0xffFF5E00),
            fontSize: 24,
            fontWeight: FontWeight(400),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Expanded(
            child: ListView.builder(
              itemCount: name.length,

              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Detalis(
                          image: imageOfItem[index],
                          namefruit: name[index],
                          pricefruit: price[index],
                        ),
                      ),
                    );
                  },
                  child: CartItem(
                    imageOfItem: imageOfItem[index],
                    name: name[index],
                    quantity: quantity[index],
                    price: price[index],
                    scale: scale[index],
                  ),
                );
              },
            ),
          ),

          CustomButton(text: "CheckOut", onPressed: () {}),
        ],
      ),
    );
  }
}
