import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:getx_basics/screen/first_page.dart';
import 'package:getx_basics/screen/second_page.dart';
import 'package:getx_basics/screen/third_page.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_basics/view/cart_page.dart';
import 'package:getx_basics/view/news_page.dart';

Future<void> main() async {
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: 'newsPage',
      defaultTransition: Transition.leftToRight,
      getPages: [
        GetPage(name: '/firstPage', page: () => const FirstPage()),
        GetPage(name: '/secondPage', page: () => const SecondPage()),
        GetPage(name: '/thirdPage', page: () => const ThirdPage()),
        GetPage(name: '/newsPage', page: () => const NewsPage()),
        GetPage(name: '/cartPage', page: () => const CartPage())
      ],
    );
  }
}
