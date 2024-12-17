import 'package:demo1_application/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, value, child) {
        if (value.items.isEmpty) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Cart"),
            ),
            body: const Column(
              children: [Center(child: Text("Your cart is empty"))],
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text("Cart"),
          ),
          body: ListView.builder(
            itemBuilder: (context, index) {
              final product = value.items[index];
              return ListTile(
                  leading: Container(
                    height: 25,
                    width: 25,
                    color: product.color,
                  ),
                  title: Text(product.name),
                  subtitle: Text("Rs${product.price.toString()}"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            value.addProduct(product);
                          },
                          icon: Icon(Icons.add)),
                      Text(product.quantity.toString()),
                      TextButton(
                          onPressed: () {
                            value.removeItem(product);
                          },
                          child: const Icon(Icons.remove)),
                    ],
                  ));
            },
            itemCount: value.items.length,
          ),
        );
      },
    );
  }
}
