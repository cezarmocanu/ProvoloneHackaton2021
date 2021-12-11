import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPrefsState {
  const SharedPrefsState();
}

class SharedPrefsInit extends SharedPrefsState {}

class SharedPrefsLoaded extends SharedPrefsState {
  final SharedPreferences prefs;
  SharedPrefsLoaded(this.prefs);
}
