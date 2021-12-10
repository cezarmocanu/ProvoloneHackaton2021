import 'package:vot_senat_client/model/todo.dart';

abstract class LoginState {
  const LoginState();
}

class LoginInit extends LoginState {}

class LoginLoading extends LoginState {}

class LoginAuthSuccess extends LoginState {}

class LoginAuthFailed extends LoginState {}
