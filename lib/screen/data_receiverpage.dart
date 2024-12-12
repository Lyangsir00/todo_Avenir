import 'package:flutter/material.dart';

class DataReceiverpage extends StatelessWidget {
  DataReceiverpage(
      {super.key, required this.firstName, required this.lastName});
  String firstName;
  String lastName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [Text(firstName), Text(lastName)],
      ),
    );
  }
}
