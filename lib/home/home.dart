import 'package:flutter/material.dart';
import 'package:retail/core/widgets/categors.dart';
import 'package:retail/core/widgets/deals.dart';
import 'package:retail/home/detalis.dart';

class Home extends StatelessWidget {
  Home({super.key});
  //.........categore item.......//

  List<String> text = [
    "Fruits",
    "Vegetables",
    "Meat",
    "Fish",
    "Ice Cream",
    "Juice",
  ];
  List<String> image = [
    "assets/images/graaps.png",
    "assets/images/pumpkin.png",
    "assets/images/Meat.png",
    "assets/images/Fish.png",
    "assets/images/ice.png",
    "assets/images/juice.png",
  ];
  List<int> bgColor = [
    0xffEDD0FF,
    0xffFFD9BA,
    0xffFACCCC,
    0xffFBC1BD,
    0xffFFDEF6,
    0xffD3E5C4,
  ];
  //.................deals........................//
  List<String> name = ["Red Apple", "Orginal Banana", "Po banana"];
  List<String> quantity = ["1kg,priceg", "2 pcs,priceg", "1 pcs,priceg"];
  List<String> price = ["\$4.99", "\$8.5", "\$5.4"];
  List<String> imagesofitem = [
    "assets/images/apple.png",
    "assets/images/banana.png",
    "assets/images/mango.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Image.asset("assets/images/dish.png"),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Categories",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight(400),
                    color: Color(0xff6D3805),
                  ),
                ),
                Text(
                  "See All",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight(400),
                    color: Color(0xffFF5E00),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: bgColor.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Categories(
                    bgColor: bgColor[index],
                    image: image[index],
                    text: text[index],
                  ),
                ),
              ),
            ),
            //SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular deals",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight(400),
                    color: Color(0xff6D3805),
                  ),
                ),
                Text(
                  "See All",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight(400),
                    color: Color(0xffFF5E00),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            SizedBox(
              height: 210,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: name.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Detalis(
                            image: imagesofitem[index],
                            namefruit: name[index],
                            pricefruit: price[index],
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: Deals(
                        imagesofitem: imagesofitem[index],
                        name: name[index],
                        price: price[index],
                        quantity: quantity[index],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
