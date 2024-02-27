import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/routes.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/view/screens/home/components/task_list.dart';
import 'package:todo_app/view/widgets/actions/custom_button.dart';

class TaskListSection extends StatelessWidget {
  final List<Task> tasks;

  const TaskListSection({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                "Your Tasks",
                style: GoogleFonts.karla(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            CustomButton(
              text: "Add",
              icon: const Icon(
                Icons.task_alt_rounded,
                color: Colors.white,
              ),
              minimumSize: const Size(130, 35),
              onPressed: () => Navigator.pushNamed(context, Routes.addTask),
            )
          ],
        ),
        const SizedBox(height: 10),
        Expanded(child: TaskList(tasks: tasks)),
      ],
    );
  }
}
