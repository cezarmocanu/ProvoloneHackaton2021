import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vot_senat_client/model/todo.dart';
import 'package:vot_senat_client/widgets/todo_list/todo_list_tile.dart';

class TodoList extends StatelessWidget {
  final List<Todo> tasks;
  const TodoList({Key? key, required this.tasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (listContext, index) {
        return TodoListTile(
          task: tasks.elementAt(index),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 8);
      },
      itemCount: tasks.length,
    );
  }
}
