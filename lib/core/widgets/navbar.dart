import 'package:flutter/material.dart';
import 'package:retail/Categories/category_Screen.dart';
import 'package:retail/cart/cart.dart';
import 'package:retail/home/home.dart';
import 'package:retail/order/order_screen.dart';
import 'package:retail/profaile/profaile_screen.dart';

class Navbar extends StatefulWidget {
  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int currentIndex = 0;

  List<Widget> Screens = [
    Home(),
    CategoryScreen(),

    Cart(),
    OrderScreen(),
    ProfaileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.shopify), label: 'orders'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xffFF5E00),
        unselectedItemColor: Color(0xff6D3805),
      ),
    );
  }
}
