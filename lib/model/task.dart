class Task {
  String title;
  bool isPinned;
  final List<TaskToDo> todos;
  late final double progress;

  Task({
    required this.title,
    this.isPinned = false,
    required this.todos,
  }) {
    final doneParameters = todos.where((parameter) => parameter.isDone).length;
    progress = doneParameters / todos.length;
  }

  static List<Task> get mockUpTasks {
    return [
      Task(
        title: 'Study for Midterm',
        isPinned: true,
        todos: [
          TaskToDo(name: 'Embedded Systems', isDone: true),
          TaskToDo(name: 'Advanced Programming', isDone: true),
          TaskToDo(name: 'Digital Circuits', isDone: false),
          TaskToDo(name: 'Energy', isDone: false),
        ],
      ),
      Task(
        title: 'Work on project',
        todos: [
          TaskToDo(name: 'Design', isDone: true),
          TaskToDo(name: 'Development', isDone: true),
          TaskToDo(name: 'Debugging', isDone: true),
          TaskToDo(name: 'Testing', isDone: false),
          TaskToDo(name: 'Deployment', isDone: false),
        ],
      ),
      Task(
        title: 'Hit GYM',
        todos: [
          TaskToDo(name: 'Warm up', isDone: true),
          TaskToDo(name: 'Weight Lifting', isDone: true),
          TaskToDo(name: 'Stretching', isDone: true),
          TaskToDo(name: 'Cardio', isDone: true),
        ],
      ),
      Task(
        title: 'Learn Flutter',
        todos: [
          TaskToDo(name: 'Widgets', isDone: true),
          TaskToDo(name: 'State Management', isDone: true),
          TaskToDo(name: 'animations', isDone: false),
          TaskToDo(name: 'User authentication', isDone: false),
          TaskToDo(name: 'Firebase', isDone: false),
        ],
      ),
      Task(
        title: 'Prepare food',
        todos: [
          TaskToDo(name: 'Buy Groceries', isDone: true),
          TaskToDo(name: 'Breakfast', isDone: true),
          TaskToDo(name: 'Lunch', isDone: true),
          TaskToDo(name: 'Dinner', isDone: false),
        ],
      ),
      Task(
        title: 'improve Reading habit',
        todos: [
          TaskToDo(name: 'read 1 page every day', isDone: true),
        ],
      ),
    ];
  }
}

class TaskToDo {
  final String name;
  final bool isDone;

  TaskToDo({
    required this.name,
    required this.isDone,
  });
}
