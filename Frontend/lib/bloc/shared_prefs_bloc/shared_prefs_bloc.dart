import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vot_senat_client/bloc/shared_prefs_bloc/shared_prefs_event.dart';
import 'package:vot_senat_client/bloc/shared_prefs_bloc/shared_prefs_state.dart';

class SharedPrefsBloc extends Bloc<SharedPrefsEvent, SharedPrefsState> {
  SharedPrefsBloc() : super(SharedPrefsInit()) {
    on<LoadSharedPrefs>(_onLoadSharedPrefs);
  }

  FutureOr<void> _onLoadSharedPrefs(
    LoadSharedPrefs event,
    Emitter<SharedPrefsState> emit,
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    emit(SharedPrefsLoaded(prefs.getKeys().isNotEmpty ? prefs : null));
  }
}
