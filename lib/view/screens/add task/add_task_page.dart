import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/controllers/tasks_provider.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/view/screens/add%20task/components/title_section.dart';
import 'package:todo_app/view/screens/add%20task/components/todos_section.dart';
import 'package:todo_app/view/widgets/actions/custom_button.dart';
import 'package:todo_app/view/widgets/misc/custom_app_bar.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final _titleController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<TextEditingController> _todosControllers = [
    TextEditingController()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: tdbgColor,
      appBar: const CustomAppBar(text: "Add Task"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 8),
              TitleSection(controller: _titleController),
              const Divider(
                color: tdPaleWhite,
                height: 50,
                indent: 10,
                endIndent: 10,
                thickness: 2,
              ),
              ToDosSection(
                controllers: _todosControllers,
                onDeleteTodo: (int index) {
                  setState(() {
                    _todosControllers.removeAt(index);
                  });
                },
              ),
              const SizedBox(height: 15),
              CustomButton(
                text: 'Add',
                icon: const Icon(
                  Icons.add_circle,
                  color: Colors.white,
                ),
                minimumSize: const Size(200, 45),
                onPressed: () {
                  setState(() {
                    _todosControllers.add(TextEditingController());
                  });
                },
              ) //Add To-Do Button
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          onPressed: () {
            if (!_formKey.currentState!.validate()) return;
            context.read<TasksProvider>().addTask(_addNewTask());
            Navigator.pop(context);
          },
          backgroundColor: tdBlue,
          shape: const CircleBorder(),
          child: const Icon(
            Icons.add_task_rounded,
            size: 32,
            color: Colors.white,
          ),
        ),
      ), //Add Task Button
    );
  }

  Task _addNewTask() {
    final List<TaskToDo> todos = [
      for (final controller in _todosControllers)
        TaskToDo(
          name: controller.text,
          isDone: false,
        ),
    ];

    return Task(
      title: _titleController.text,
      todos: todos,
    );
  }
}
