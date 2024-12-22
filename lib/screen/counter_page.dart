import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_basics/controller/counter_controller.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final CounterController controller = CounterController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => Text(
                "${controller.count}",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              )),
          Center(
              child: TextButton(
                  onPressed: () {
                    controller.increment();
                    Get.bottomSheet(
                        Container(
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
                  child: Text(
                    "Increment",
                    style: TextStyle(fontSize: 20),
                  ))),
          TextButton(
              onPressed: () {
                controller.decrement();
                Get.snackbar('Decrement click', "decrement by 1");
              },
              child: Text(
                "Decrement",
                style: TextStyle(fontSize: 20),
              ))
        ],
      ),
    );
  }
}
