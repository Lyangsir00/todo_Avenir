import 'package:get/get.dart';
import 'package:getx_basics/model/news_model.dart';
import 'package:getx_basics/repository/news_repository.dart';

class NewsController extends GetxController {
  var isLoading = true.obs;
  var samples = <Sample>[].obs;
  NewsRepository repository = NewsRepository();

  @override
  void onInit() {
    super.onInit();
    fetchSample();
  }

  void fetchSample() async {
    try {
      isLoading(true);
      final data = await repository.fetchSample();
      // samples.assignAll(data!);
      if (data != null) {
        samples.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
