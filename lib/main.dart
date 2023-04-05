import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mypcot_infotech_assignement/utils/routes.dart';
import '../view/splash/splash_screen.dart';
import '../utils/constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Assignment',
      debugShowCheckedModeBanner: false,
      initialRoute: kInitialRoute,
      theme: ThemeData(
          fontFamily: 'Roboto',
          textTheme: Theme.of(context)
              .textTheme
              .apply(bodyColor: kTextColor, displayColor: kTextColor)),
      getPages: routes,
      locale: const Locale('en', 'EN'),
    );
  }
}
