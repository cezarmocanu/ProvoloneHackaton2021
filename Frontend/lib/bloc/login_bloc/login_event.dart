abstract class LoginEvent {
  const LoginEvent();
}

class LogIn extends LoginEvent {
  final String password;
  final String username;

  LogIn(
    this.username,
    this.password,
  );
}

class LogOut extends LoginEvent {}
