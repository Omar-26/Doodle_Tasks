import 'package:flutter/material.dart';
import 'package:pie_menu/pie_menu.dart';
import 'package:provider/provider.dart';

// import 'package:task_one/view/widgets/misc/task_progress_indicator.dart';
// import 'package:task_one/view/widgets/task%20tile/pie_menu_button.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/view/widgets/misc/task_progress_indicator.dart';
import 'package:todo_app/view/widgets/task_tile/pie_menu_button.dart';

class TaskTile extends StatelessWidget {
  final Task task;

  const TaskTile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 8, 9, 8),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(40), color: tdGrey),
      child: Row(
        children: [
          TaskProgressIndicator(progress: task.progress, size: 35),
          const SizedBox(width: 18),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                '${task.todos.length} tasks',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const Spacer(),
          PieMenuButton(task: task),
        ],
      ),
    );
  }
}
