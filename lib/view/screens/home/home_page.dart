import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_menu/pie_menu.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/controllers/tasks_provider.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/view/screens/home/components/task_list.dart';
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
            appBar: CustomAppBar(
              text: AnimatedTextKit(
                totalRepeatCount: 1,
                // repeatForever: true,
                animatedTexts: [
                  WavyAnimatedText(
                    "Doodle",
                    speed: const Duration(
                      milliseconds: 300,
                    ),
                    textStyle: GoogleFonts.pacifico(
                      textStyle: const TextStyle(
                        color: tdtextColor,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              // text: Text(
              //   "Doodle",
              //   style:
              // ),
              trailing: const Icon(
                Icons.settings,
                size: 28,
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  const SliverToBoxAdapter(
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        GreetingSection(),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                  if (pinnedTask != null)
                    SliverToBoxAdapter(
                        child: PinnedTaskSection(task: pinnedTask)),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        TaskListSection(tasks: tasksProvider.tasks),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                  TaskList(tasks: tasksProvider.tasks),
                  const SliverToBoxAdapter(child: SizedBox(height: 10)),
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
