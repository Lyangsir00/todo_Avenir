import 'package:demo1_application/constant/const.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _items = [];
  List<Product> get items => _items;
  // void addProduct(Product item) {
  //   _items.add(item);
  //   notifyListeners();
  // }

  void addProduct(Product item) {
    final productDetail = productsDetails.firstWhere(
      (product) => product.id == item.id,
      orElse: () => Product(
        id: item.id,
        name: item.name,
        price: item.price,
        color: item.color,
        quantity: 0, // default fallback value when no match is found
      ),
    );
    for (var product in _items) {
      if (product.id == item.id) {
        if (product.quantity < productDetail.quantity) {
          product.quantity += 1;
        }
        notifyListeners();
        return;
      }
    }
    _items.add(Product(
        id: item.id,
        quantity: 1,
        name: item.name,
        price: item.price,
        color: item.color));
    notifyListeners();
  }

  // void removeItem(Product item) {
  //   _items.remove(item);
  //   notifyListeners();
  // }
  void removeItem(Product item) {
    for (var product in _items) {
      if (product.id == item.id) {
        if (product.quantity > 1) {
          product.quantity -= 1; // Decrease quantity
        } else {
          _items.remove(product); // Remove product if quantity is 1
        }
        notifyListeners();
        return;
      }
    }
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }

  double getCartTotal() {
    return _items.fold(
        0, (total, item) => total + (item.price * item.quantity));
  }
}
