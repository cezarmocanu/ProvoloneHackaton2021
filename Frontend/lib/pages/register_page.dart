import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vot_senat_client/bloc/register_bloc/register_bloc.dart';
import 'package:vot_senat_client/bloc/register_bloc/register_state.dart';
import 'package:vot_senat_client/bloc/shared_prefs_bloc/shared_prefs_bloc.dart';
import 'package:vot_senat_client/bloc/shared_prefs_bloc/shared_prefs_event.dart';
import 'package:vot_senat_client/bloc/shared_prefs_bloc/shared_prefs_state.dart';
import 'package:vot_senat_client/constants.dart';
import 'package:vot_senat_client/widgets/register/register_form.dart';

import '../routes.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  void initState() {
    super.initState();
    context.read<SharedPrefsBloc>().add(LoadSharedPrefs());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<RegisterBloc, RegisterState>(
          listener: (context, registerState) {
            if (registerState is RegisterSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                RoutesEnum.TODO,
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
        appBar: AppBar(
          title: const Text('Register page'),
          backgroundColor: Colors.black,
        ),
        body: RegisterForm(),
      ),
    );
  }
}
