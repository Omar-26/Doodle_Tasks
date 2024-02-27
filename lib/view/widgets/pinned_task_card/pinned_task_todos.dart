import 'package:flutter/material.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/view/widgets/misc/task_progress_indicator.dart';
import 'package:todo_app/view/widgets/pinned_task_card/pinned_task_todo.dart';

class PinnedTaskTodos extends StatelessWidget {
  final Task task;
  const PinnedTaskTodos({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child:
        Column(
          children: [
            for (var todo in task.todos) ...[
              if (task.todos.indexOf(todo) != 0)
                const SizedBox(height: 4),
              PinnedTaskTodo(taskTodo: todo),
            ]
          ],
        ),
        ),
        Column(
          children: [
            const SizedBox(height:20),
            TaskProgressIndicator(
              progress: task.progress,
              size: 70,
            ),
          ],
        )
      ],
    );
  }
}
