import 'dart:js';

import 'package:darkmode/home.dart';
import 'package:darkmode/themestate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<ThemeState>(
    builder: (context) => ThemeState(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Provider.of<ThemeState>(context).theme == ThemeType.DARK
          ? ThemeData.dark()
          : ThemeData.light(),
      home: MyHomePage(),
    );
  }
}
