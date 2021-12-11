import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vot_senat_client/bloc/login_bloc/login_event.dart';
import 'package:vot_senat_client/bloc/login_bloc/login_state.dart';
import 'package:vot_senat_client/repo/login_repo.dart';

import '../../constants.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInit()) {
    on<LogIn>(_onLogin);
    on<LogOut>(_onLogut);
  }

  FutureOr<void> _onLogin(LogIn event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    Response response = await LoginRepo.instance.login(event.username, event.password);

    // TODO abstract this into a function like isResponseSuccess
    if (response.statusCode ~/ 100 == 2) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = jsonDecode(response.body)[SharedPrefsKeys.TOKEN] ?? "";
      prefs.setString(SharedPrefsKeys.TOKEN, token);
      emit(LoginAuthSuccess());
    } else {
      emit(LoginAuthFailed());
    }
  }

  FutureOr<void> _onLogut(LogOut event, Emitter<LoginState> emit) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(SharedPrefsKeys.TOKEN, "");
    emit(LoginInit());
  }
}
