import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vot_senat_client/bloc/login_bloc/login_bloc.dart';
import 'package:vot_senat_client/bloc/login_bloc/login_event.dart';
import 'package:vot_senat_client/bloc/login_bloc/login_state.dart';
import 'package:vot_senat_client/widgets/login/login_form.dart';

import '../routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<LoginBloc, LoginState>(
          listener: (context, loginState) {
            if (loginState is LoginAuthSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                RoutesEnum.TODO,
                (route) => false,
              );
            }
          },
        ),
      ],
      child: Scaffold(
        body: LoginForm(),
      ),
    );
  }
}
