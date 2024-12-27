import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_basics/controller/counter_controller.dart';

class CounterSecond extends StatefulWidget {
  const CounterSecond({super.key});

  @override
  State<CounterSecond> createState() => _CounterSecondState();
}

class _CounterSecondState extends State<CounterSecond> {
  final CounterController controller = Get.find<CounterController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SecondCounterPage"),
      ),
      body: Column(
        children: [
          Obx(() => Text(
                "${controller.count}",
                style:
                    const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              )),
          Center(
              child: TextButton(
                  onPressed: () {
                    controller.increment();
                  },
                  child: const Text(
                    "Increment",
                    style: TextStyle(fontSize: 20),
                  ))),
          TextButton(
            onPressed: () {
              controller.decrement();
              Get.snackbar('Decrement click', "decrement by 1");
            },
            child: const Text(
              "Decrement",
              style: TextStyle(fontSize: 20),
            ),
          ),
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("back"))
        ],
      ),
    );
  }
}
