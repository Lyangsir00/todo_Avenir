import 'dart:convert';

import 'package:todo_app_2/model/news_model.dart';
import 'package:http/http.dart' as http;

class NewsApi {
  List<Sample> sample = [];
  Future<List<Sample>> getSample() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for (Map<String, dynamic> index in data) {
        sample.add(Sample.fromJson(index));
      }
      return sample;
    } else {
      return sample;
    }
  }
}
