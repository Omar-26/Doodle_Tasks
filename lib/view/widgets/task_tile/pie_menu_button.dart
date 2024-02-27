import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pie_menu/pie_menu.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/controllers/tasks_provider.dart';
import 'package:todo_app/model/task.dart';

class PieMenuButton extends StatelessWidget {
  final Task task;
  const PieMenuButton({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksProvider>(
      builder: (context, tasksProvider, _) {
        return PieMenu(
          onPressed: () => _showSnackBarMessageOnTap(context),
          onToggle: (isOpen) {
            if (isOpen) {
              // Vibrate
              HapticFeedback.lightImpact();
            }
          },
          actions: [
            PieAction(
                tooltip: const Text('Delete'),
                onSelect: () => tasksProvider.removeTask(task),
                child: const Icon(Icons.delete),
                buttonTheme: const PieButtonTheme(
                    backgroundColor: tdBlue, iconColor: Colors.white)),
            PieAction(
                tooltip: const Text('Pin'),
                onSelect: () => tasksProvider.pinTask(task),
                child: const Icon(Icons.push_pin),
                buttonTheme: const PieButtonTheme(
                    backgroundColor: tdBlue, iconColor: Colors.white)),
          ],
          child: IconButton(
            icon: const Icon(Icons.more_vert_rounded),
            onPressed: () {},
          ),
        );
      },
    );
  }

  void _showSnackBarMessageOnTap(BuildContext context) {
    // Hide the previous message
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    // Show the message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: EdgeInsets.all(20),
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        shape: StadiumBorder(),
        backgroundColor: tdBlue,
        content: Row(
          children: [
            Icon(Icons.info, color: Colors.white, size: 30),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                'Please hold and drag to select an action.',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w900),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
