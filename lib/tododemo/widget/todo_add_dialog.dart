import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final VoidCallback? savaTask;
  final VoidCallback? cancel;
  final TextEditingController controller;

  const DialogBox(
      {super.key,
      required this.savaTask,
      required this.cancel,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellowAccent,
      content: SizedBox(
        height: 200,
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // text Field
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add New Task"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: savaTask,
                  child: Text("SAVA"),
                ),
                const SizedBox(
                  width: 8,
                ),
                ElevatedButton(onPressed: cancel, child: Text("CANCEL"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
