import 'package:bloc_pattern/api/services.dart';
import 'package:bloc_pattern/bloc/album_bloc/album_bloc.dart';
import 'package:bloc_pattern/bloc/album_bloc/theme/them_bloc.dart';
import 'package:bloc_pattern/bloc/album_bloc/theme/theme_event.dart';
import 'package:bloc_pattern/bloc/album_bloc/theme/theme_state.dart';
import 'package:bloc_pattern/screen/album_screen.dart';
import 'package:bloc_pattern/setting/preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Themebloc(),
      child: BlocBuilder<Themebloc, Themestate>(
        builder: (BuildContext context, Themestate themestate) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: themestate.themeData,
              home: BlocProvider(
                create: (context) => AlbumBloc(albumRepo: Albumservices()),
                child: AlbumScreen(),
              ));
        },
      ),
    );
  }
}
