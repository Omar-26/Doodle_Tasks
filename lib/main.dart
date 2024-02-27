import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants/routes.dart';
import 'package:todo_app/controllers/tasks_provider.dart';
import 'view/screens/add task/add_task_page.dart';
import 'view/screens/home/home_page.dart';
import 'package:todo_app/constants/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TasksProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: tdbgColor,
          primaryColor: Colors.grey,
          colorScheme: const ColorScheme.dark(primary: tdbgColor),
          textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
          ),),
        title: 'To-Do App',
        home: const HomePage(),
        routes: {
          Routes.home: (context) => const HomePage(),
          Routes.addTask: (context) => const AddTaskPage(),
        },
      ),
    );
  }
}
