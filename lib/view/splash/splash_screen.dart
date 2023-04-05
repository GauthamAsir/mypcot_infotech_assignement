import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../dashboard/dashboard_view.dart';

class SplashScreen extends StatelessWidget {

  static String routeName = "/splash_view";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(milliseconds: 500), () {
      Get.offAndToNamed(DashboardView.routeName);
    });

    return Scaffold(
      body: Center(
        child: Text('Splash Screen', style: Get.textTheme.headline6,),
      ),
    );
  }
}
