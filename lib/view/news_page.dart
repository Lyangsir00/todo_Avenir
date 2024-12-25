import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_basics/controller/news_controller.dart';
import 'package:getx_basics/view/product_page.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final NewsController _controller = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton.icon(
                onPressed: () {
                  Get.to(() => const ProductPage());
                },
                label: const Icon(Icons.home)),
            TextButton(
                onPressed: () {
                  Get.toNamed("firstPage");
                },
                child: const Text("FirstPage"))
          ],
          title: const Text("SampleNews"),
        ),
        body: Obx(() {
          if (_controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              // final sample = _controller.samples[index];
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                margin:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_controller.samples[index].id.toString()),
                    Text(_controller.samples[index].userId.toString()),
                    Text(_controller.samples[index].title.toString()),
                    Text(_controller.samples[index].body.toString())
                  ],
                ),
              );
            },
            itemCount: _controller.samples.length,
          );
        }));
  }
}
