import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/list_provider.dart';
import 'package:flutter_application_1/screen/secondscreen_page.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _FirstsscreenPageState();
}

class _FirstsscreenPageState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumberListProvider>(
      builder: ((context, numberProvideModel, child) => Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                numberProvideModel.add();
              },
              child: const Icon(Icons.add),
            ),
            body: SizedBox(
              child: Column(
                children: [
                  Text(
                    numberProvideModel.numbers.last.toString(),
                    style: const TextStyle(fontSize: 30),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Text(
                          numberProvideModel.numbers[index].toString(),
                          style: const TextStyle(fontSize: 30),
                        );
                      },
                      itemCount: numberProvideModel.numbers.length,
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SecondscreenPage()));
                      },
                      child: const Text("NextScreen"))
                ],
              ),
            ),
          )),
    );
  }
}
