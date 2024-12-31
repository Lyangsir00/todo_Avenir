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
    return Card(
      // color: Colors.blueGrey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Row(
        children: [
          Checkbox(
            value: taskCompleted,
            onChanged: onChanged,
            checkColor: Colors.white,
            activeColor: Colors.black,
            side: const BorderSide(color: Colors.black),
          ),
          Text(
            taskName,
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                decoration: taskCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                decorationThickness: 5,
                decorationColor: Colors.white),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
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
    );
  }
}
