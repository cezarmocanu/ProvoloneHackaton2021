import 'package:flutter/material.dart';
import 'package:vot_senat_client/widgets/login/login_input.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vot_senat_client/bloc/login_bloc/login_bloc.dart';
import 'package:vot_senat_client/bloc/login_bloc/login_event.dart';
import 'package:vot_senat_client/bloc/login_bloc/login_state.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _emailController = TextEditingController();
    _passwordController = TextEditingController();
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
            title: 'Username',
            isPassword: false,
            controller: _emailController,
          ),
          LoginInputFied(
            title: 'Password',
            isPassword: true,
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
                child: const Text('LOGIN'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
