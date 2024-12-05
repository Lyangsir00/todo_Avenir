import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/list_provider.dart';
import 'package:provider/provider.dart';

class SecondscreenPage extends StatefulWidget {
  const SecondscreenPage({
    super.key,
  });

  @override
  State<SecondscreenPage> createState() => _SecondscreenPageState();
}

class _SecondscreenPageState extends State<SecondscreenPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumberListProvider>(
      builder: ((context, numberListProvider, child) => Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                numberListProvider.add();
              },
              child: const Icon(Icons.add),
            ),
            body: SizedBox(
              child: Column(
                children: [
                  Text(
                    numberListProvider.numbers.last.toString(),
                    style: const TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Text(
                          numberListProvider.numbers[index].toString(),
                          style: const TextStyle(fontSize: 30),
                        );
                      },
                      itemCount: numberListProvider.numbers.length,
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
