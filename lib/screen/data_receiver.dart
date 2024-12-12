import 'package:demo1_application/model/todos_model.dart';
import 'package:flutter/material.dart';

class DataReceiver extends StatefulWidget {
  const DataReceiver({
    super.key,
  });

  @override
  State<DataReceiver> createState() => _LoginPageState();
}

class _LoginPageState extends State<DataReceiver> {
  @override
  Widget build(BuildContext context) {
    final todoData = ModalRoute.of(context)?.settings.arguments as Todo?;
    if (todoData == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            Text("id: ${todoData.id}"),
            Text("title: ${todoData.title}")
          ],
        ),
      ),
    );
  }
}
