import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vot_senat_client/bloc/shared_prefs_bloc/shared_prefs_bloc.dart';
import 'package:vot_senat_client/bloc/shared_prefs_bloc/shared_prefs_event.dart';
import 'package:vot_senat_client/bloc/shared_prefs_bloc/shared_prefs_state.dart';

import '../routes.dart';

class SpashPage extends StatefulWidget {
  @override
  State<SpashPage> createState() => _SpashPageState();
}

class _SpashPageState extends State<SpashPage> {
  @override
  void initState() {
    super.initState();
    context.read<SharedPrefsBloc>().add(LoadSharedPrefs());
  }

  Future<void> navigateOutside() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushNamedAndRemoveUntil(
      context,
      RoutesEnum.HOME,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SharedPrefsBloc, SharedPrefsState>(
          listener: (context, sharedPrefsState) {
            if (sharedPrefsState is SharedPrefsLoaded) {
              navigateOutside();
            }
          },
        ),
      ],
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Provolone :)",
                style: Theme.of(context).textTheme.headline1,
              ),
              const SizedBox(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(
                  strokeWidth: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
