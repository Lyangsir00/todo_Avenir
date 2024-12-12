import 'dart:convert';

import 'package:demo1_application/model/todos_model.dart';
import 'package:http/http.dart' as http;

class TodoService {
  Future<List<Todo>> getAll() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final todos = json.map((e) {
        return Todo(
            id: e['id'],
            userId: e['userId'],
            title: e['title'],
            completed: e['completed']);
      }).toList();
      return todos;
    } else {
      throw "Something went wrong";
    }
  }
}
