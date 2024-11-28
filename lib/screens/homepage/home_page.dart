import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app_2/screens/Auth/screens/login_page.dart';
import 'package:todo_app_2/utility/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user = FirebaseAuth.instance.currentUser;
  List todoList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadTasks();
  }

  void checkBoxChanged(int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
    saveTasks();
  }

  void savedNewTask() {
    if (_taskController.text.trim().isNotEmpty) {
      setState(() {
        todoList.add([_taskController.text.trim(), false]);
        _taskController.clear();
        saveTasks();
      });
    } else {
      // Optionally show a message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Task cannot be empty!"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  final TextEditingController _taskController = TextEditingController();

  void deleteTask(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  Future<void> saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String encodedData = jsonEncode(todoList); // Convert to JSON string
    await prefs.setString('todoList', encodedData);
  }

  Future<void> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String? encodedData = prefs.getString('todoList');
    if (encodedData != null) {
      setState(() {
        todoList = jsonDecode(encodedData); // Convert JSON string to List
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 117, 66, 206),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 131, 4, 153),
        title: const Text(
          "Simple Todo",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            icon: const Icon(
              Icons.logout_sharp,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return TodoList(
            taskName: todoList[index][0],
            taskCompleted: todoList[index][1],
            onChanged: (value) => checkBoxChanged(index),
            deleteFunction: () => deleteTask(index),
          );
        },
        itemCount: todoList.length,
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 020),
        child: Row(
          children: [
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      maxLength: 20,
                      controller: _taskController,
                      decoration: InputDecoration(
                        hintText: "Add new Todo task",
                        filled: true,
                        fillColor: Colors.deepPurple.shade200,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple),
                        ),
                      ),
                    ))),
            FloatingActionButton(
              onPressed: savedNewTask,
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
