import 'package:demo1_application/api/api.dart';
import 'package:demo1_application/screen/second_screen.dart';

import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: 500,
                child: FutureBuilder(
                  future: _api.getData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      //// If data is successfully fetched and available:
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.blue),
                            height: 200,
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
            ],
          ),
        ),
      ),
    );
  }
}
