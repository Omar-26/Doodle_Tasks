import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/view/widgets/misc/task_progress_indicator.dart';
import 'package:todo_app/view/widgets/pinned_task_card/pinned_task_todos.dart';

class PinnedTaskSection extends StatelessWidget {
  final Task task;

  const PinnedTaskSection({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 24, 24, 24),
      decoration: BoxDecoration(
        color: tdGrey,
        borderRadius: BorderRadius.circular(50),
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
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Text(
                        task.title,
                        style: GoogleFonts.karla(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: SvgPicture.asset(
                      'assets/pin.svg',
                      width: 32,
                      colorFilter:
                          const ColorFilter.mode(tdBlue, BlendMode.srcIn),
                    ),
                  ),
                ],
              ),
              const Divider(
                color: tdtextColor,
                thickness: 1.4,
                indent: 24,
                endIndent: 75,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: PinnedTaskTodos(
                  task: task,
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
