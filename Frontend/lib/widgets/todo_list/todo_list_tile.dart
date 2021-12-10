import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vot_senat_client/model/todo.dart';

class TodoListTile extends StatelessWidget {
  final Todo task;

  const TodoListTile({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        task.completed ? Icons.check : Icons.warning_amber_outlined,
        color: task.completed ? Colors.green : Colors.deepOrange,
      ),
      tileColor: Colors.white,
      title: Text(task.title),
      subtitle: Text(
        task.completed ? "Completed" : "To do",
        style: Theme.of(context).textTheme.caption,
      ),
    );
  }
}
