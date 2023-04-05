import 'package:flutter/material.dart';

class CustomerView extends StatelessWidget {

  static String routeName = "/customers_view";

  const CustomerView({Key? key}) : super(key: key);

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
