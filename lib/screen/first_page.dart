import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:getx_basics/screen/counter_page.dart';
import 'package:getx_basics/screen/second_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FirstPage"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.toNamed('/secondPage?a=1&b=2');
                },
                child: const Text("Navigate to second")),
            ElevatedButton(
                onPressed: () {
                  Get.to(() => CounterPage());
                },
                child: Text("CounterPage"))
          ],
        ),
      ),
    );
  }
}
