import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app_2/api/news_api.dart';
import 'package:todo_app_2/screens/Auth/screens/login_page.dart';
import 'package:todo_app_2/screens/product/product_page.dart';
import 'package:todo_app_2/utility/todo_list.dart';
import 'package:todo_app_2/widgets/custom_buttom.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user = FirebaseAuth.instance.currentUser;
  List todoList = [];

  final NewsApi _api = NewsApi();
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
        const SnackBar(
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
      saveTasks();
    });
  }

  void editTask(int index) {
    TextEditingController editController = TextEditingController();
    editController.text = todoList[index][0]; // Pre-fill with current task name

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Task"),
          content: TextField(
            controller: editController,
            decoration: const InputDecoration(hintText: "Enter new task name"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog without saving
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                if (editController.text.trim().isNotEmpty) {
                  setState(() {
                    todoList[index][0] = editController.text.trim();
                  });
                  saveTasks(); // Save updated tasks
                  Navigator.pop(context); // Close dialog after saving
                } else {
                  // Optionally show a message for empty input
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Task name cannot be empty!"),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
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
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 131, 4, 153),
        title: const Text(
          "Simple Todo",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {
                Get.to(() => const ProductPage(),
                    transition: Transition.zoom,
                    duration: const Duration(seconds: 1));
              },
              child: const Icon(Icons.next_plan)),
          CustomButton(
            borderRadius: BorderRadius.circular(10),
            buttonText: "Product Page",
            backgroundColor: const Color.fromARGB(255, 131, 4, 153),
            textColor: Colors.white,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ProductPage(),
              ));
            },
          ),
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
      body: Column(children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              child: FutureBuilder(
                future: _api.getSample(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return Card(
                          // color: const Color.fromARGB(255, 212, 64, 239),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 10),
                          child: InkWell(
                            onTap: () {
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (context) => NewPage(
                              //         data: snapshot.data?[index])));
                            },
                            child: Column(
                              children: [
                                Text("${snapshot.data?[index].id}"),
                                Text(
                                  "${snapshot.data?[index].title}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${snapshot.data?[index].body}",
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: snapshot.data?.length ?? 0,
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: SizedBox(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return TodoList(
                  taskName: todoList[index][0],
                  taskCompleted: todoList[index][1],
                  onChanged: (value) => checkBoxChanged(index),
                  deleteFunction: () => deleteTask(index),
                  editTask: () => editTask(index),
                );
              },
              itemCount: todoList.length,
            ),
          ),
        ),
      ]),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 020),
        child: Row(
          children: [
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: _taskController,
                      decoration: InputDecoration(
                        hintText: "Add new Todo task",
                        filled: true,
                        fillColor: Colors.deepPurple.shade200,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple),
                        ),
                      ),
                    ))),
            FloatingActionButton(
              onPressed: savedNewTask,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
