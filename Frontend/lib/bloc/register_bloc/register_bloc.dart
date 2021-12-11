import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:vot_senat_client/bloc/register_bloc/register_event.dart';
import 'package:vot_senat_client/bloc/register_bloc/register_state.dart';
import 'package:vot_senat_client/repo/register_repo.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInit()) {
    on<Register>(_onLogin);
  }

  FutureOr<void> _onLogin(Register event, Emitter<RegisterState> emit) async {
    emit(RegisterLoading());

    Response response = await RegisterRepo.instance.login(event.username, event.password);

    // TODO abstract this into a function like isResponseSuccess
    if (response.statusCode ~/ 100 == 2) {
      emit(RegisterSuccess());
    } else {
      emit(RegisterFailed());
    }
  }
}
