import 'package:demo1_application/models/new_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  List<Sample> sample = [];
  // Function to fetch data from the API.
  Future<List<Sample>> getData() async {
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

class Demo {
  List<Sample> samples = [];
  Future<List<Sample>> getDatas() async {
    final response = await http.get(Uri.parse("uri"));
    if (response.statusCode == 2000) {
      final daTa = jsonDecode(response.body);
      for (Map<String, dynamic> index in daTa) {
        samples.add(Sample.fromJson(index));
      }
      return samples;
    } else {
      return samples;
    }
  }
}
