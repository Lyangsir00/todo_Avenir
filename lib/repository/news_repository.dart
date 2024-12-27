import 'dart:convert';

import 'package:getx_basics/model/news_model.dart';
import 'package:http/http.dart' as http;

class NewsRepository {
  List<Sample> sample = [];
  Future<List<Sample>?> fetchSample() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if (response.statusCode == 200) {
      // var data = jsonDecode(response.body);
      // for (Map<String, dynamic> index in data) {
      //   sample.add(Sample.fromJson(index));
      // }
      List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => Sample.fromJson(item)).toList();
    } else {
      return null;
    }
  }
}
