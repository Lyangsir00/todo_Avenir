import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CounterController extends GetxController {
  var count = 0.obs;
  final storage = GetStorage();
  var name = "demo".obs;

  void savedName(String newName) {
    storage.write("name", "Suman");
  }

  void loadName() {
    name.value = storage.read("name") ?? "Demo";
  }

  void onInit() {
    count.value = storage.read<int>('counter') ?? 0;
    super.onInit();
  }

  void increment() {
    count++;
    storage.write('counter', count.value);
  }

  void decrement() {
    count--;
    storage.write('counter', count.value);
  }
}
