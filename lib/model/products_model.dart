import 'package:flutter/material.dart';

class ProductDetail {
  String name;
  int id;
  double price;
  int quantity;
  Color color;
  ProductDetail(
      {required this.id,
      required this.name,
      required this.color,
      required this.price,
      required this.quantity});
}

List<ProductDetail> productDetails = [
  ProductDetail(
      id: 1, name: "Book", color: Colors.green, price: 300, quantity: 3),
  ProductDetail(
      id: 2, name: "Football", color: Colors.purple, price: 3500, quantity: 4),
  ProductDetail(
      id: 3, name: "Bottle", color: Colors.pink, price: 3300, quantity: 2),
  ProductDetail(
      id: 4, name: "Laptop", color: Colors.grey, price: 1300, quantity: 5),
  ProductDetail(
      id: 5, name: "Mobile", color: Colors.yellow, price: 100, quantity: 9)
];
