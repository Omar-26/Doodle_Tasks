import 'package:flutter/material.dart';
import 'package:pie_menu/pie_menu.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/controllers/tasks_provider.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/view/widgets/misc/custom_app_bar.dart';
import 'package:todo_app/view/screens/home/components/greeting_section.dart';
import 'package:todo_app/view/widgets/pinned_task_card/pinned_task_section.dart';
import 'package:todo_app/view/screens/home/components/task_list_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Task> _tasks = [];

  @override
  void initState() {
    super.initState();
    _tasks.addAll(Task.mockUpTasks);
  }

  @override
  Widget build(BuildContext context) {
    return PieCanvas(
      theme: _pieTheme(),
      child: Consumer<TasksProvider>(
        builder: (context, tasksProvider, _) {
          final Task? pinnedTask = tasksProvider.tasks.cast<Task?>().firstWhere(
                (task) => task!.isPinned,
                orElse: () => null,
              );
          return Scaffold(
            backgroundColor: tdbgColor,
            appBar: const CustomAppBar(trailing: Icon(Icons.settings)),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
              child: Column(
                children: [
                  const GreetingSection(),
                  const SizedBox(height: 25),
                  if (pinnedTask != null) PinnedTaskSection(task: pinnedTask),
                  const SizedBox(height: 28),
                  Expanded(child: TaskListSection(tasks: tasksProvider.tasks)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  PieTheme _pieTheme() => const PieTheme(
        brightness: Brightness.dark,
        pointerColor: Colors.transparent,
        radius: 65,
        rightClickShowsMenu: true,
        buttonTheme:
            PieButtonTheme(backgroundColor: tdGrey, iconColor: Colors.white),
        buttonThemeHovered: PieButtonTheme(
            backgroundColor: Colors.black, iconColor: Colors.white),
      );
}
