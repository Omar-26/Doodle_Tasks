import 'package:animated_line_through/animated_line_through.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants/colors.dart';

// import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/controllers/tasks_provider.dart';
import 'package:todo_app/model/task.dart';

class PinnedTaskTodo extends StatefulWidget {
  final TaskToDo taskTodo;
  final Task task;

  const PinnedTaskTodo({super.key, required this.taskTodo, required this.task});

  @override
  State<PinnedTaskTodo> createState() => _PinnedTaskTodoState();
}

class _PinnedTaskTodoState extends State<PinnedTaskTodo> {
  bool isChecked = false;

  // Another way to add Button Animation
  // TODO Add - with SingleTickerProviderStateMixin - besides State<PinnedTaskTodo>
  // late AnimationController _animationController;
  // bool isPlaying = false;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _animationController = AnimationController(
  //       vsync: this, duration: const Duration(milliseconds: 450));
  // }
  //
  // @override
  // void dispose() {
  //   super.dispose();
  //   _animationController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksProvider>(
      builder: (context, tasksProvider, _) {
        return Row(
          children: [
            Row(
              children: [
                MSHCheckbox(
                  size: 23,
                  value: widget.taskTodo.isDone,
                  duration: const Duration(milliseconds: 600),
                  colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                    checkedColor: tdGreen,
                  ),
                  style: MSHCheckboxStyle.stroke,
                  onChanged: (selected) {
                    setState(() {
                      isChecked = selected;
                      widget.taskTodo.isDone = !widget.taskTodo.isDone;
                      if (widget.taskTodo.isDone) {
                        tasksProvider.addTodoDone(widget.task);
                      } else {
                        tasksProvider.removeTodoDone(widget.task);
                      }
                    });
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            SizedBox(
              width: 205,
              child: AnimatedLineThrough(
                duration: const Duration(milliseconds: 600),
                reverseDuration: const Duration(milliseconds: 100),
                isCrossed: widget.taskTodo.isDone,
                strokeWidth: 1.5,
                color: tdGreen,
                child: Text(
                  widget.taskTodo.name,
                  style: TextStyle(
                    fontSize: 17,
                    overflow: TextOverflow.ellipsis,
                    color: widget.taskTodo.isDone ? tdGreen : Colors.white,
                  ),
                ),
              ),
            ),
            // Another way to add Button Animation
            // IconButton(
            //   onPressed: () => _handleOnPressed(),
            // ),
            // IconButton(
            //   onPressed: () {
            //     setState(
            //       () {
            //         widget.taskTodo.isDone = !widget.taskTodo.isDone;
            //         if (widget.taskTodo.isDone) {
            //           tasksProvider.addTodoDone(widget.task);
            //         } else {
            //           tasksProvider.removeTodoDone(widget.task);
            //         }
            //         isPlaying = !isPlaying;
            //         isPlaying
            //             ? _animationController.forward()
            //             : _animationController.reverse();
            //       },
            //     );
            //   },
            //   // icon: Icon(
            //   //   widget.taskTodo.isDone
            //   //       ? Icons.check_circle_outline_rounded
            //   //       : Icons.circle_outlined,
            //   // ),
            //   icon: AnimatedIcon(
            //     icon: AnimatedIcons.play_pause,
            //     progress: _animationController,
            //   ),
            //   iconSize: 26,
            //   splashColor: Colors.green,
            //   color: widget.taskTodo.isDone ? Colors.green : Colors.white,
            // ),
          ],
        );
      },
    );
  }
}
