import 'package:get/get.dart';
import 'package:getx_basics/model/products_model.dart';

class ProductController extends GetxController {
  final List<ProductDetail> _item = <ProductDetail>[].obs;
  List<ProductDetail> get item => _item;
  void add(ProductDetail items) {
    item.add(items);
  }

  void remove(ProductDetail items) {
    item.remove(items);
  }
}
