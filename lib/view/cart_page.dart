import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_basics/controller/product_controller.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final ProductController controller = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CartPage"),
      ),
      body: Obx(() {
        if (controller.item.isEmpty) {
          return const Center(child: Text("No items in the cart"));
        }
        return ListView.builder(
          itemBuilder: (context, index) {
            final product = controller.item[index];
            return ListTile(
              leading: Container(height: 25, width: 25, color: product.color),
              title: Text(product.name),
              subtitle: Text(product.price.toString()),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                      onPressed: () {
                        controller.remove(product);
                      },
                      child: const Icon(Icons.remove))
                ],
              ),
            );
          },
          itemCount: controller.item.length,
        );
      }),
    );
  }
}
