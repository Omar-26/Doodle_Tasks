import 'package:flutter/material.dart';

import '../model/task.dart';

class TasksProvider extends ChangeNotifier {
  final List<Task> _tasks = [];
  final Task task = Task(title: 'Learn Flutter', todos: [
    TaskToDo(name: 'Widgets', isDone: true),
  ]);

  TasksProvider() {
    _tasks.addAll(Task.mockUpTasks); // Initializing The List With Mockup Values
  }

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void removeTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void removeTodoDone(Task task) {
    task.progress -= 1 / (task.todos.length);
    notifyListeners();
  }

  void addTodoDone(Task task) {
    task.progress += 1 / (task.todos.length);
    notifyListeners();
  }

  void pinTask(Task task) {
    // Unpin any other pinned task
    for (var task in _tasks) {
      if (task.isPinned) {
        task.isPinned = false;
      }
    }
    //Pin The Desired Task
    task.isPinned = true;
    notifyListeners();
  }
}
