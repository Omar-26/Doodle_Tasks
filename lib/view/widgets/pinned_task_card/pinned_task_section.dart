import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/view/widgets/pinned_task_card/pinned_task_todos.dart';

class PinnedTaskSection extends StatelessWidget {
  final Task task;

  const PinnedTaskSection({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: tdGrey,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      task.title,
                      style: GoogleFonts.karla(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/pin.svg',
                    width: 30,
                    colorFilter:
                        const ColorFilter.mode(tdBlue, BlendMode.srcIn),
                  ),
                  const SizedBox(
                    width: 8,
                  )
                ],
              ),
              const Divider(
                color: tdtextColor,
                thickness: 1,
                endIndent: 70,
              ),
              PinnedTaskTodos(
                task: task,
              ),
            ],
          ))
        ],
      ),
    );
  }
}
