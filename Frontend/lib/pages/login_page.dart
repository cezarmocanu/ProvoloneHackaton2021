import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vot_senat_client/bloc/login_bloc/login_bloc.dart';
import 'package:vot_senat_client/bloc/login_bloc/login_state.dart';
import 'package:vot_senat_client/bloc/shared_prefs_bloc/shared_prefs_bloc.dart';
import 'package:vot_senat_client/bloc/shared_prefs_bloc/shared_prefs_event.dart';
import 'package:vot_senat_client/bloc/shared_prefs_bloc/shared_prefs_state.dart';
import 'package:vot_senat_client/pages/splash_page.dart';
import 'package:vot_senat_client/widgets/login/login_form.dart';

import '../constants.dart';
import '../routes.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
            }
          },
        ),
      ],
      child: BlocBuilder<SharedPrefsBloc, SharedPrefsState>(
        builder: (context, sharedPrefsState) {
          if (sharedPrefsState is SharedPrefsLoaded && sharedPrefsState.prefs!.getString(SharedPrefsKeys.TOKEN)!.isNotEmpty) {
            return Container();
          }

          return Scaffold(
            body: LoginForm(),
          );
        },
      ),
    );
  }
}
