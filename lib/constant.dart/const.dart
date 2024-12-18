import 'package:flutter/material.dart';

class Product {
  final int id;
  final String name;
  final double price;
  final Color color;
  int quantity;
  Product(
      {required this.id,
      required this.quantity,
      required this.name,
      required this.price,
      required this.color});
}

final List<Product> productsDetails = [
  Product(id: 0, name: "Laptop", price: 220, color: Colors.green, quantity: 5),
  Product(
      id: 1,
      name: "Mobile",
      price: 500,
      color: Colors.lightGreenAccent,
      quantity: 15),
  Product(
      id: 2, name: "Football", price: 200, color: Colors.blue, quantity: 25),
  Product(id: 3, name: "demo", price: 100, color: Colors.pink, quantity: 2),
  Product(id: 4, name: "bottle", price: 10, color: Colors.purple, quantity: 2),
  Product(id: 5, name: "Pen", price: 200, color: Colors.brown, quantity: 3)
];
