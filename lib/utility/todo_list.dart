import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  TodoList(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.deleteFunction,
      required this.onChanged});
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final VoidCallback? deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 131, 4, 153),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Checkbox(
              value: taskCompleted,
              onChanged: onChanged,
              checkColor: Colors.white,
              activeColor: Colors.black,
              side: BorderSide(color: Colors.white),
            ),
            Text(
              taskName,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationThickness: 5,
                  decorationColor: Colors.white),
            ),
            Spacer(),
            TextButton(
                onPressed: deleteFunction,
                child: Icon(
                  Icons.delete,
                  color: Colors.red,
                ))
          ],
        ),
      ),
    );
  }
}
