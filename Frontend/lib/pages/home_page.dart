import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/src/provider.dart';
import 'package:vot_senat_client/bloc/login_bloc/login_bloc.dart';
import 'package:vot_senat_client/bloc/login_bloc/login_event.dart';
import 'package:vot_senat_client/bloc/shared_prefs_bloc/shared_prefs_bloc.dart';
import 'package:vot_senat_client/bloc/shared_prefs_bloc/shared_prefs_event.dart';
import 'package:vot_senat_client/bloc/shared_prefs_bloc/shared_prefs_state.dart';
import 'package:vot_senat_client/constants.dart';
import 'package:vot_senat_client/pages/register_page.dart';
import 'package:vot_senat_client/pages/todo_page.dart';

import '../routes.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  initState() {
    super.initState();
    context.read<SharedPrefsBloc>().add(LoadSharedPrefs());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home page"),
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<SharedPrefsBloc, SharedPrefsState>(
        builder: (context, sharedPrefState) {
          if (sharedPrefState is SharedPrefsLoaded) {
            bool loggedIn = sharedPrefState.prefs!.getString(SharedPrefsKeys.TOKEN)!.isNotEmpty;

            return Column(
              children: [
                //TODO create custom button with styling
                if (loggedIn)
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TodoPage()));

                      // Navigator.pushNamed(
                      //   context,
                      //   RoutesEnum.TODO,
                      // );
                    },
                    child: Center(
                      child: Text("Go to todo"),
                    ),
                  ),
                if (!loggedIn)
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));

                      // Navigator.pushNamed(
                      //   context,
                      //   RoutesEnum.LOGIN,
                      // );
                    },
                    child: Center(
                      child: Text("Go to login"),
                    ),
                  ),
                if (!loggedIn)
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                      // Navigator.pushNamed(
                      //   context,
                      //   RoutesEnum.REGISTER,
                      // );
                    },
                    child: Center(
                      child: Text("Go to register"),
                    ),
                  ),
                if (loggedIn)
                  ElevatedButton(
                    onPressed: () {
                      context.read<LoginBloc>().add(LogOut());
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));

                      // Navigator.pushNamed(
                      //   context,
                      //   RoutesEnum.LOGIN,
                      //
                      // );
                    },
                    child: Center(
                      child: Text("Logout"),
                    ),
                  ),
              ],
            );
          }

          return Container(
            child: Text("..."),
          );
        },
      ),
    );
  }
}
