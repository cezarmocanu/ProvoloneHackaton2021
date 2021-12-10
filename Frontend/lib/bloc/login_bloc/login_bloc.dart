import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:vot_senat_client/bloc/login_bloc/login_event.dart';
import 'package:vot_senat_client/bloc/login_bloc/login_state.dart';
import 'package:vot_senat_client/repo/login_repo.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInit()) {
    on<LogIn>(_onLogin);
  }

  FutureOr<void> _onLogin(LogIn event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    Response response = await LoginRepo.instance.login(event.username, event.password);

    // TODO abstract this into a function like isResponseSuccess
    if (response.statusCode ~/ 100 == 2) {
      emit(LoginAuthSuccess());
    } else {
      emit(LoginAuthFailed());
    }
  }
}
