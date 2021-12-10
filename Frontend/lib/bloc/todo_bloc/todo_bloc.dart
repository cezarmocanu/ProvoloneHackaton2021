import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:vot_senat_client/bloc/todo_bloc/todo_event.dart';
import 'package:vot_senat_client/bloc/todo_bloc/todo_state.dart';
import 'package:vot_senat_client/model/todo.dart';
import 'package:vot_senat_client/repo/todo_repo.dart';
import 'package:vot_senat_client/service/todo_service.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInit()) {
    on<TodoGetAll>(_onGetAll);
  }

  FutureOr<void> _onGetAll(TodoGetAll event, Emitter<TodoState> emit) async {
    emit(TodoLoading());

    Response response = await TodoRepo.instance.getAllTasks();

    if (response.statusCode == HttpStatus.ok) {
      List<Todo> tasks = TodoService.instance.deserializeResponseBodyToList(response.body);
      emit(TodoGetSuccess(tasks));
    } else {
      emit(TodoGetFailure());
    }
  }
}
