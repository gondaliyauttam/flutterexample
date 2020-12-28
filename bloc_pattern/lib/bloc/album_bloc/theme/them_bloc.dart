import 'package:bloc_pattern/bloc/album_bloc/theme/theme_event.dart';
import 'package:bloc_pattern/bloc/album_bloc/theme/theme_state.dart';
import 'package:bloc_pattern/setting/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Themebloc extends Bloc<Themeevent, Themestate> {
  Themebloc()
      : super(
          Themestate(
            Appthemes.appthemeData[Apptheme.lightTheme],
          ),
        );
  @override
  Stream<Themestate> mapEventToState(Themeevent event) async* {
    if (event is Themeevent) {
      yield Themestate(
        Appthemes.appthemeData[event.appthemes],
      );
    }
  }
}
