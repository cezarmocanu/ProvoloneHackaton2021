import 'dart:convert';

import 'package:vot_senat_client/model/todo.dart';

class TodoService {
  const TodoService._internal();

  static const TodoService instance = TodoService._internal();

  List<Todo> deserializeResponseBodyToList(String body) {
    return (json.decode(body) as List).map((item) => Todo.fromJson(item)).toList();
  }
}
