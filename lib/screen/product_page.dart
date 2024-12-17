import 'package:demo1_application/constant/const.dart';
import 'package:demo1_application/provider/cart_provider.dart';
import 'package:demo1_application/screen/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          appBar: AppBar(
            title: const Text("Products"),
            actions: [
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
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                color: const Color.fromARGB(255, 185, 187, 185),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: ListTile(
                    leading: Container(
                      height: 25,
                      width: 25,
                      color: products.color,
                      child: Center(
                        child: Text(
                          products.quantity.toString(),
                          style: TextStyle(
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
