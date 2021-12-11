import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vot_senat_client/bloc/shared_prefs_bloc/shared_prefs_bloc.dart';
import 'package:vot_senat_client/bloc/shared_prefs_bloc/shared_prefs_event.dart';
import 'package:vot_senat_client/bloc/shared_prefs_bloc/shared_prefs_state.dart';

import '../constants.dart';
import '../routes.dart';
import 'home_page.dart';
import 'login_page.dart';

class SpashPage extends StatefulWidget {
  @override
  State<SpashPage> createState() => _SpashPageState();
}

class _SpashPageState extends State<SpashPage> {
  bool sharedPrefsLoaded = false;
  bool navigatedOutside = false;

  @override
  void initState() {
    super.initState();

    if (!sharedPrefsLoaded) {
      context.read<SharedPrefsBloc>().add(LoadSharedPrefs());
      setState(() {
        sharedPrefsLoaded = true;
      });
    }
  }

  Future<void> navigateOutside(Widget page) async {
    if (!navigatedOutside) {
      await Future.delayed(Duration(seconds: 3));
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => page), (route) => false);
      setState(() {
        navigatedOutside = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SharedPrefsBloc, SharedPrefsState>(
          listener: (context, sharedPrefsState) {
            if (sharedPrefsState is SharedPrefsLoaded) {
              if (sharedPrefsState.prefs!.getString(SharedPrefsKeys.TOKEN)!.isNotEmpty) {
                navigateOutside(HomePage());
              } else {
                if (!navigatedOutside) {
                  navigateOutside(LoginPage());
                }
              }
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
