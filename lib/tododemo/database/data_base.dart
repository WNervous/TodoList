import 'package:hive_flutter/adapters.dart';

class TodoListManager {
  static const String fileName = "todoBox";
  static const String saveKey = "todoList";
  var box = Hive.box(fileName);
  List todoList = <List>[];
  final _defaultTaskList = [
    ["A", false],
    ["B", false],
    ["C", false],
    ["D", false],
  ];

  List getTask() {
    return todoList;
  }

  bool isEmpty() {
    return box.get(saveKey) == null;
  }

  void createInitializeList() {
    if (isEmpty()) {
      todoList = _defaultTaskList;
    } else {
      todoList = box.get(saveKey);
    }
  }

  void addTask(List task) {
    todoList.add(task);
  }

  void remove(int index) {
    todoList.removeAt(index);
  }

  void saveData() {
    box.put(saveKey, todoList);
  }
}
