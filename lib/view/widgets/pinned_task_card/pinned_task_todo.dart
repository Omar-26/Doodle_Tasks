import 'package:flutter/material.dart';
import 'package:todo_app/model/task.dart';

class PinnedTaskTodo extends StatelessWidget {
  final TaskToDo taskTodo;
  const PinnedTaskTodo({super.key,required this.taskTodo});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Icon(
          taskTodo.isDone? Icons.check_circle_outline_rounded : Icons.circle_outlined,
          color: taskTodo.isDone? Colors.green : Colors.white,
          size: 24,
        ),
        const SizedBox(width: 10),
        Text(
            taskTodo.name,
            style: TextStyle(
              fontSize: 16,
              color: taskTodo.isDone? Colors.green : Colors.white,
              // color: Colors.green,
            )),
      ],
    );
  }
}
