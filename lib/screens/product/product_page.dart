import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_2/screens/cart/cart_page.dart';
import 'package:todo_app_2/constant.dart/const.dart';
import 'package:todo_app_2/provider/cart_provider.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, value, child) => Scaffold(
          backgroundColor: const Color.fromARGB(255, 117, 66, 206),
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 131, 4, 153),
            title: const Text(
              "Products",
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Container(
                    height: 20,
                    color: Colors.green,
                    child: const Text("return"),
                  )),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CartPage()));
                  },
                  icon: const Icon(Icons.shopping_cart))
            ],
          ),
          body: ListView.builder(
            itemCount: productsDetails.length,
            itemBuilder: (context, index) {
              final products = productsDetails[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                color: const Color.fromARGB(255, 185, 187, 185),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
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
                          value.addProduct(products);
                        },
                        child: const Icon(Icons.add))),
              );
            },
          )),
    );
  }
}
