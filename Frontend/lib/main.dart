import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vot_senat_client/bloc/todo_bloc/todo_bloc.dart';
import 'package:vot_senat_client/routes.dart';

import 'bloc/login_bloc/login_bloc.dart';
import 'bloc/register_bloc/register_bloc.dart';
import 'bloc/shared_prefs_bloc/shared_prefs_bloc.dart';

void main() async {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => TodoBloc(),
        ),
        BlocProvider(
          create: (BuildContext context) => LoginBloc(),
        ),
        BlocProvider(
          create: (BuildContext context) => RegisterBloc(),
        ),
        BlocProvider(
          create: (BuildContext context) => SharedPrefsBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RoutesEnum.SPLASH,
        routes: routesMap,
      ),
    );
  }
}
