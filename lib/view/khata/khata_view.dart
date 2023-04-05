import 'package:flutter/material.dart';

class KhataView extends StatelessWidget {

  static String routeName = "/khata_view";

  const KhataView({Key? key}) : super(key: key);

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
