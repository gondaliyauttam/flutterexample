import 'package:darkmode/themestate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Switch(
            value: Provider.of<ThemeState>(context).theme == ThemeType.DARK,
            onChanged: (value) {
              Provider.of<ThemeState>(context).theme =
                  value ? ThemeType.DARK : ThemeType.LIGHT;
              setState(() {});
            }),
      ),
    );
  }
}
