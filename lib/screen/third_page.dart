import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ThirdPage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.toNamed('firstPage');
                },
                child: const Text("Go to first")),
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("back"))
          ],
        ),
      ),
    );
  }
}
