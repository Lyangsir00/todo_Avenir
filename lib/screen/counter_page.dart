import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_basics/controller/counter_controller.dart';
import 'package:getx_basics/screen/counter_second.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final CounterController controller = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FirstCounterPage"),
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
                    Get.bottomSheet(
                        const SizedBox(
                          height: 200,
                          child: Text(
                            "this is a bottomsheet example",
                            style: TextStyle(fontSize: 40),
                          ),
                        ),
                        isDismissible: true,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        backgroundColor: Colors.purple);
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
              )),
          TextButton(
            onPressed: () {
              Get.to(() => const CounterSecond());
            },
            child: const Text("SecondPage"),
          )
        ],
      ),
    );
  }
}
