import 'package:demo1_application/screen/data_receiverpage.dart';
import 'package:demo1_application/widgets/inputbutton.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            InputField(
              controller: firstNameController,
              hintText: "Firstname",
            ),
            SizedBox(
              height: 10,
            ),
            InputField(
              controller: lastNameController,
              hintText: "Lastname",
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DataReceiverpage(
                            firstName: firstNameController.text.trim(),
                            lastName: lastNameController.text.trim(),
                          )));
                },
                child: const Text("Go to another page"))
          ],
        ),
      ),
    );
  }
}
