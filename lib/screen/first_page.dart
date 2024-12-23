import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_basics/controller/counter_controller.dart';
import 'package:getx_basics/screen/counter_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final storage = GetStorage();

  final CounterController controller = CounterController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FirstPage"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Get.snackbar("Saved", "data added successfully");
                    controller.savedName("Suman");
                  },
                  child: const Text(
                    "Write",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Obx(
                  () => Text(
                    controller.name.value,
                    style: const TextStyle(fontSize: 50),
                  ),
                ),
                const Spacer(),
                InkWell(
                    onTap: () {
                      controller.loadName();
                    },
                    child: const Text(
                      "Read",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed('/secondPage?a=1&b=2');
                },
                child: const Text("Navigate to second")),
            ElevatedButton(
                onPressed: () {
                  Get.to(() => const CounterPage());
                },
                child: const Text("CounterPage"))
          ],
        ),
      ),
    );
  }
}
