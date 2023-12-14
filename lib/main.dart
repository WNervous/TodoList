import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'tododemo/todo_home_page.dart';

main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox("todoBox");
  runApp(const TodoPage());
}

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TodoHomePage(),
    );
  }
}
