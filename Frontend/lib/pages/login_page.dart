import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vot_senat_client/bloc/login_bloc/login_bloc.dart';
import 'package:vot_senat_client/bloc/login_bloc/login_state.dart';
import 'package:vot_senat_client/bloc/shared_prefs_bloc/shared_prefs_bloc.dart';
import 'package:vot_senat_client/bloc/shared_prefs_bloc/shared_prefs_event.dart';
import 'package:vot_senat_client/bloc/shared_prefs_bloc/shared_prefs_state.dart';
import 'package:vot_senat_client/widgets/login/login_form.dart';

import '../constants.dart';
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
    context.read<SharedPrefsBloc>().add(LoadSharedPrefs());
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
                RoutesEnum.HOME,
                (route) => false,
              );
            }
          },
        ),
        BlocListener<SharedPrefsBloc, SharedPrefsState>(
          listener: (context, sharedPrefsState) {
            if (sharedPrefsState is SharedPrefsLoaded) {
              if (sharedPrefsState.prefs.getString(SharedPrefsKeys.TOKEN)!.length > 0) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  RoutesEnum.HOME,
                  (route) => false,
                );
              }
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
