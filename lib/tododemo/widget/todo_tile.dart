import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool completeTask;
  final Function(bool? b) onChange;
  final Function(BuildContext context) deleteTask;

  const TodoTile(
      {super.key,
      required this.taskName,
      required this.completeTask,
      required this.onChange,
      required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, top: 24, right: 24),
      child: Slidable(
        endActionPane: ActionPane(motion: const ScrollMotion(), children: [
          SlidableAction(
            backgroundColor: Colors.red,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12)),
            onPressed: deleteTask,
            icon: Icons.delete,
          )
        ]),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.yellowAccent,
              borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              // checkbox
              Checkbox(
                value: completeTask,
                onChanged: onChange,
                checkColor: Colors.black,
              ),
              // task name
              Text(
                taskName,
                style: TextStyle(
                    decoration: completeTask
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
