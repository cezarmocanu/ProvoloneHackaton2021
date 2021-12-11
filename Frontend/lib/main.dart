import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vot_senat_client/bloc/todo_bloc/todo_bloc.dart';
import 'package:vot_senat_client/routes.dart';

import 'bloc/groups_bloc/groups_bloc.dart';
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
          create: (BuildContext context) => GroupsBloc(),
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
          brightness: Brightness.light,
          primaryColor: const Color(0xFF68CA87),
          colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: const Color(0xFF68CA87),
                secondary: const Color(0xFF655EB0),
                background: const Color(0xFFFBFAF7),
                onBackground: const Color(0xFF2b2d42),
                onPrimary: const Color(0xFFFBFAF7),
                onSecondary: const Color(0xFFFBFAF7),
              ),
        ),
        initialRoute: RoutesEnum.SPLASH,
        routes: routesMap,
      ),
    );
  }
}
