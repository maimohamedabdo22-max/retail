import 'package:flutter/material.dart';
import 'package:retail/core/widgets/categors.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});
  List<String> text = [
    "Fruits",
    "Vegetables",
    "Meat",
    "Fish",
    "Ice Cream",
    "Juice",
    "Sea Food",
    "Egg & Milk",
    "Cake",
    "Hand Wash",
  ];
  List<String> image = [
    "assets/images/graaps.png",
    "assets/images/pumpkin.png",
    "assets/images/Meat.png",
    "assets/images/Fish.png",
    "assets/images/ice.png",
    "assets/images/juice.png",
    "assets/images/seafoad.png",
    "assets/images/milk.png",
    "assets/images/cake.png",
    "assets/images/HandWash.png",
  ];
  List<int> bgColor = [
    0xffEDD0FF,
    0xffFFD9BA,
    0xffFACCCC,
    0xffFBC1BD,
    0xffFFDEF6,
    0xffD3E5C4,
    0xffFFE299,
    0xffDAF2FC,
    0xffFECA97,
    0xffD6FAE9,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Categories",
          style: TextStyle(
            color: Color(0xffFF5E00),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xffF3F3F3),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                hint: Text(
                  "Search",
                  style: TextStyle(color: Color(0xff6D3805), fontSize: 16),
                ),

                prefixIcon: Icon(Icons.search),
                prefixIconColor: Color(0xff6D3805),
              ),
            ),
          ),
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.only(top: 30),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: text.length,
        itemBuilder: (context, index) {
          return Categories(
            bgColor: bgColor[index],
            image: image[index],
            text: text[index],
          );
        },
      ),
    );
  }
}
