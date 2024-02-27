import 'package:flutter/material.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/view/widgets/task_tile/task_tile.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;

  const TaskList({super.key, required this.tasks});
 
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: tasks.length,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final task = tasks[index];
        return TaskTile(task: task);
      },
    );
  }
}
