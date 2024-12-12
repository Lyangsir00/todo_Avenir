import 'package:demo1_application/api/api.dart';
import 'package:demo1_application/provider/api_provider.dart';
import 'package:demo1_application/screen/new_page.dart';
import 'package:demo1_application/screen/second_screen.dart';
import 'package:demo1_application/widgets/custom_buttons.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //A list to hold the data fetched from the API
  final Api _api = Api();

  @override
  Widget build(BuildContext context) {
    return Consumer<ApiProvider>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
        ),
        body: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                CustomButton(
                  borderRadius: BorderRadius.circular(5),
                  buttonText: "third screen",
                  onTap: () {
                    Navigator.pushNamed(context, '/thirdScreen');
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  buttonText: "secondScreen",
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SecondScreen()));
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 590,
                  child: FutureBuilder(
                    future: _api.getSampleData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.blue),
                              height: 200,
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => NewPage(
                                          data: snapshot.data?[index])));
                                },
                                child: Column(
                                  children: [
                                    Text("${snapshot.data?[index].id}"),
                                    Text("${snapshot.data?[index].userId}"),
                                    Text(
                                      "${snapshot.data?[index].title}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "${snapshot.data?[index].body}",
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: snapshot.data?.length ?? 0,
                        );
                      } else {
                        //// If the data is not yet available, show a loading spinner.
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomButton(
                  borderRadius: BorderRadius.circular(5),
                  buttonText: "Login",
                  onTap: () {
                    Navigator.pushNamed(context, "/loginPage");
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
