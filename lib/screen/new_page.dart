import 'package:flutter/material.dart';

class NewPage extends StatefulWidget {
  const NewPage({
    super.key,
    required this.data,
  });
  final data;

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text("Id: ${widget.data.id}"),
          Text("userId: ${widget.data.userId}"),
          Text("${widget.data.title}"),
          Text("${widget.data.body}")
        ],
      ),
    );
  }
}
