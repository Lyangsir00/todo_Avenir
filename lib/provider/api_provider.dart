import 'package:demo1_application/api/todo_service.dart';
import 'package:demo1_application/models/todos_model.dart';
import 'package:flutter/material.dart';

class ApiProvider extends ChangeNotifier {
  TodoService service = TodoService();
  bool isLoading = false;

  List<Todo> todos = [];

  Future<void> getAllTodo() async {
    isLoading = true;
    notifyListeners();

    final response = service.getAll();

    todos = await response;
    isLoading = false;
    notifyListeners();
  }
}
