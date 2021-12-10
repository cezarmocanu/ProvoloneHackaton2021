import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vot_senat_client/bloc/todo_bloc/todo_bloc.dart';
import 'package:vot_senat_client/bloc/todo_bloc/todo_event.dart';
import 'package:vot_senat_client/bloc/todo_bloc/todo_state.dart';
import 'package:vot_senat_client/widgets/todo_list/todo_list.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  void initState() {
    super.initState();
    context.read<TodoBloc>().add(TodoGetAll());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, todoState) {
          if (todoState is TodoLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (todoState is TodoGetFailure) {
            return Center(
              child: Row(
                children: const [
                  Icon(Icons.warning),
                  Text("Your todo tasks could not be loaded correctly"),
                ],
              ),
            );
          }
          if (todoState is TodoGetSuccess) {
            return TodoList(tasks: todoState.tasks);
          }
          return const Center(
            child: Text("Ooops, you reached an unhandled state"),
          );
        },
      ),
    );
  }
}
