import 'package:vot_senat_client/model/todo.dart';

abstract class TodoState {
  const TodoState();
}

class TodoInit extends TodoState {}

class TodoLoading extends TodoState {}

class TodoGetSuccess extends TodoState {
  final List<Todo> tasks;
  TodoGetSuccess(this.tasks);
}

class TodoGetFailure extends TodoState {
  TodoGetFailure();
}
