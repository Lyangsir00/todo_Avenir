import 'package:demo1_application/login/login_page.dart';
import 'package:demo1_application/provider/api_provider.dart';
import 'package:demo1_application/provider/cart_provider.dart';
import 'package:demo1_application/screen/data_receiver.dart';
import 'package:demo1_application/screen/home_page.dart';
import 'package:demo1_application/screen/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => ApiProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
        routes: {
          "/loginPage": (context) => const LoginPage(),
          "/thirdScreen": (context) => const ThirdScreen(),
          "/dataReceiver": (context) => const DataReceiver()
        },
      ),
    );
  }
}
