<p align="center">
  <img src="https://github.com/Omar-26/Doodle_Tasks/blob/main/assets/icon.png?raw=true"  height="120"/>
  <h3 align="center">Doodle</h3>
  <p align="center">A Todo List App</p>
  <p align="center">
    <img src="https://img.shields.io/badge/platform-IOS%20%7C%20Android-blue.svg" alt="Platforms">
  </p>
</p>

## Overview

**Doodle** is a sleek and intuitive task management application built using Flutter. It allows users to manage their tasks efficiently with features like animated greetings, pinned tasks, and a beautiful, responsive UI. The app is designed with user experience in mind, providing a seamless task management experience on both Android and iOS devices.

## Screenshots

![Home Screen](https://github.com/Omar-26/Doodle_Tasks/blob/main/assets/presentation.png?raw=true)

## Features

- **Provider State Management**: Efficient state management using `provider`.
- **Pinned Tasks**: Easily pin important tasks to access them quickly.
- **Animated Greetings**: A warm, animated greeting using `AnimatedTextKit`.
- **Task List**: View, add, and manage your tasks in a structured list.
- **Custom App Bar**: Stylish app bar with a wavy text animation.
- **Pie Menu Integration**: Unique pie menu for additional functionality.
- **Responsive Design**: Smooth scrolling with `CustomScrollView` and `Slivers`.

## Architecture

Doodle follows the MVC (Model-View-Controller) design pattern to ensure a clean separation of concerns and maintainability. Here's an overview of the architecture:

### Model

- **Task**: Represents the data structure for tasks, including properties like title, description, and pinned status.

### View

- **HomePage**: The main screen that displays the task list and pinned tasks.
- **CustomAppBar**: Custom app bar with animated text.
- **GreetingSection**: Displays a greeting message to the user.
- **PinnedTaskSection**: Displays pinned tasks.
- **TaskListSection**: Displays a list of tasks.
- **TaskList**: A detailed list view of all tasks.

### Controller

- **TasksProvider**: Manages the state of tasks and provides methods to manipulate the task data. It interacts with the model and notifies the view of any changes.

## Installation

To get started with Doodle, follow these steps:

1. **Clone the repository:**

    ```sh
    git clone https://github.com/Omar-26/Doodle_Tasks.git
    cd Doodle_Tasks
    ```

2. **Install dependencies:**

    ```sh
    flutter pub get
    ```

3. **Run the application:**

    ```sh
    flutter run
    ```

## Usage

1. **Adding Tasks:**
   - Open the app and navigate to the task list section.
   - Use the provided UI to add new tasks.

2. **Pinning Tasks:**
   - Long press on a task to pin it. Pinned tasks will appear in the Pinned Task section.

3. **Using the Pie Menu:**
   - Right-click (or long press) on the screen to bring up the pie menu for additional options.

## Contributing

Contributions are welcome! If you have any ideas, or suggestions, or find a bug, please open an issue or submit a pull request. Follow these steps to contribute:

1. Fork the repository.
2. Create a new branch: `git checkout -b feature/your-feature-name`
3. Make your changes and commit them: `git commit -m 'Add some feature'`
4. Push to the branch: `git push origin feature/your-feature-name`
5. Open a pull request.

## License

This project is licensed under the MIT License.

---
