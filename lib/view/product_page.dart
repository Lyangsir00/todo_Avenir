import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_basics/controller/product_controller.dart';
import 'package:getx_basics/model/products_model.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final ProductController controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ProductPage"),
        actions: [
          TextButton(
              onPressed: () {
                Get.toNamed("cartPage");
              },
              child: const Icon(
                Icons.shopping_cart,
              ))
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final products = productDetails[index];
          return Card(
            child: ListTile(
              leading: Container(
                decoration: BoxDecoration(
                    color: products.color,
                    borderRadius: BorderRadius.circular(20)),
                height: 25,
                width: 25,
                child: Center(
                  child: Text(
                    products.quantity.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              title: Text(products.name),
              subtitle: Text(products.price.toString()),
              trailing: TextButton(
                  onPressed: () {
                    controller.add(products);
                    Get.snackbar("Products", "Added successfully");
                  },
                  child: const Icon(Icons.add)),
            ),
          );
        },
        itemCount: productDetails.length,
      ),
    );
  }
}
