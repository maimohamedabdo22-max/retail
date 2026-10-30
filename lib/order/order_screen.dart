import 'package:flutter/material.dart';
import 'package:retail/core/widgets/order.dart';

/// Flutter code sample for [TabBar].

class OrderScreen extends StatelessWidget {
  OrderScreen({super.key});
  final List<String> Ordernum = [
    "Order #345",
    "Order #278",
    "Order #158",
    "Order #785",
    "Order #359",
    "Order #148",
    "Order #178",
    "Order #120",
    "Order #258",
    "Order #147",
    "Order #369",
  ];
  List<String> OrderStutes = [
    "Delivered",
    "Delivered",
    "Delivered",
    "Delivered",
    "Cancelled",
    "Delivered",
    "Cancelled",
    "Delivered",
    "Delivered",
    "Cancelled",
    "Delivered",
  ];
  List<String> data = [
    "October 26, 2026",
    "Novamber 21, 2026",
    "October 14, 2026",
    "October 22, 2026",
    "October 24, 2026",
    "October 26, 2026",
    "October 6, 2026",
    "October 1, 2026",
    "October 18, 2026",
    "October 22, 2026",
    "October 15, 2026",
  ];
  List<String> price = [
    r"$452",
    r"$452",
    r"$452",
    r"$452",
    r"$452",
    r"$452",
    r"$452",
    r"$452",
    r"$452",
    r"$452",
    r"$452",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TabBarExample(
        orderNumbers: Ordernum,
        orderStatuses: OrderStutes,
        dates: data,
        prices: price,
      ),
    );
  }
}

class TabBarExample extends StatelessWidget {
  const TabBarExample({
    super.key,
    required this.orderNumbers,
    required this.orderStatuses,
    required this.dates,
    required this.prices,
  });

  final List<String> orderNumbers;
  final List<String> orderStatuses;
  final List<String> dates;
  final List<String> prices;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Orders',
            style: TextStyle(
              color: Color(0xffFF5E00),
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
          centerTitle: true,
          bottom: TabBar(
            labelColor: Color(0xffFF5E00),
            unselectedLabelColor: Color(0xff6D3805),
            indicatorColor: Color(0xffFF5E00),
            indicatorWeight: 4,
            labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            unselectedLabelStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
            tabs: <Widget>[
              Tab(text: "Ongoing"),
              Tab(text: "History"),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(child: Text("No Orders")),
            Center(
              child: ListView.builder(
                itemCount: orderNumbers.length,
                itemBuilder: (context, index) {
                  return Order(
                    Ordernum: orderNumbers[index],
                    OrderStutes: orderStatuses[index],
                    data: dates[index],
                    price: prices[index],
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
