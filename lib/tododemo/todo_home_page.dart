import 'package:flutter/material.dart';

import 'database/data_base.dart';
import 'widget/todo_add_dialog.dart';
import 'widget/todo_tile.dart';

class TodoHomePage extends StatefulWidget {
  const TodoHomePage({super.key});

  @override
  State<TodoHomePage> createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHomePage> {
  final TextEditingController _controller = TextEditingController();
  TodoListManager manager = TodoListManager();

  @override
  void initState() {
    super.initState();
    manager.createInitializeList();
  }

  // task click
  _taskChange(bool? b, int index) {
    manager.todoList[index][1] = !(manager.todoList[index][1] as bool);
    setState(() {});
    manager.saveData();
  }

  // add task dialog
  void _showAddTaskDialog() {
    print("addtask");
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            savaTask: _addTask,
            cancel: _cancel,
            controller: _controller,
          );
        });
  }

  // add task to list
  void _addTask() {
    setState(() {
      manager.addTask([_controller.text, false]);
      _controller.clear();
    });
    manager.saveData();
    Navigator.of(context).pop();
  }

  void _deleteTask(int index) {
    setState(() {
      manager.remove(index);
    });
    manager.saveData();
  }

  void _cancel() {
    _controller.clear();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(
          backgroundColor: Colors.yellowAccent,
        ),
        body: ListView.builder(
            itemCount: manager.todoList.length,
            itemBuilder: (context, index) {
              return TodoTile(
                taskName: manager.todoList[index][0].toString(),
                completeTask: manager.todoList[index][1] as bool,
                onChange: (b) => _taskChange(b, index),
                deleteTask: (context) => _deleteTask(index),
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: _showAddTaskDialog,
          shape: const CircleBorder(),
          backgroundColor: Colors.yellowAccent,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
