import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SecondPage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(Get.parameters["a"] ?? "null"),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed('thirdPage');
                },
                child: const Text("Go to third")),
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
