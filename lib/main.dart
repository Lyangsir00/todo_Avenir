import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:getx_basics/screen/first_page.dart';
import 'package:getx_basics/screen/second_page.dart';
import 'package:getx_basics/screen/third_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: 'firstPage',
      defaultTransition: Transition.leftToRight,
      getPages: [
        GetPage(name: '/firstPage', page: () => const FirstPage()),
        GetPage(name: '/secondPage', page: () => const SecondPage()),
        GetPage(name: '/thirdPage', page: () => const ThirdPage())
      ],
    );
  }
}
