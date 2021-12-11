abstract class RegisterEvent {
  const RegisterEvent();
}

class Register extends RegisterEvent {
  final String password;
  final String username;
  final String email;
  final String firstName;
  final String lastName;

  Register(
    this.username,
    this.email,
    this.password,
    this.firstName,
    this.lastName,
  );
}
