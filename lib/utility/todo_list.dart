import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  const TodoList(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.deleteFunction,
      required this.onChanged,
      required this.editTask});
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final VoidCallback? deleteFunction;
  final Function() editTask;

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
              side: const BorderSide(color: Colors.white),
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
            const Spacer(),
            TextButton(
                onPressed: deleteFunction,
                child: const Icon(
                  Icons.delete,
                  color: Colors.red,
                )),
            TextButton(onPressed: editTask, child: const Icon(Icons.edit))
          ],
        ),
      ),
    );
  }
}
