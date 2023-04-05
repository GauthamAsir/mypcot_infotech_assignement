import 'package:flutter/material.dart';

class OrdersView extends StatelessWidget {
  static String routeName = "/orders_view";

  const OrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        routeName,
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}
