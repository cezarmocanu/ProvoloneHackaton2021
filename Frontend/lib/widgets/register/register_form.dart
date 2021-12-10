import 'package:flutter/material.dart';
import 'package:vot_senat_client/widgets/login/login_input.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vot_senat_client/bloc/login_bloc/login_bloc.dart';
import 'package:vot_senat_client/bloc/login_bloc/login_event.dart';
import 'package:vot_senat_client/bloc/login_bloc/login_state.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  RegisterFormState createState() {
    return RegisterFormState();
  }
}

class RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _usernameController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _usernameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LoginInputFied(
            title: 'First Name',
            isPassword: false,
            hintText: 'Please enter your first name',
            controller: _firstNameController,
          ),
          LoginInputFied(
            title: 'Last Name',
            isPassword: false,
            hintText: 'Please enter your last name',
            controller: _lastNameController,
          ),
          LoginInputFied(
            title: 'Email',
            isPassword: false,
            hintText: 'Please enter your email',
            controller: _emailController,
          ),
          LoginInputFied(
            title: 'Username',
            isPassword: false,
            hintText: 'Please enter your username',
            controller: _usernameController,
          ),
          LoginInputFied(
            title: 'Password',
            isPassword: true,
            hintText: 'Please enter your password',
            controller: _passwordController,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(300, 50),
                  primary: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<LoginBloc>().add(LogIn(_emailController.text, _passwordController.text));
                  }
                },
                child: const Text('REGISTER'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
