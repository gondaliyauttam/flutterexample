import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DarkLighthtme();
  }
}

class DarkLighthtme extends StatefulWidget {
  @override
  _DarkLighthtmeState createState() => _DarkLighthtmeState();
}

ThemeData _darktheme = ThemeData(
    accentColor: Colors.red,
    brightness: Brightness.dark,
    primaryColor: Colors.amber,
    buttonTheme: ButtonThemeData(buttonColor: Colors.amber));

ThemeData _lighttheme = ThemeData(
    accentColor: Colors.pink,
    brightness: Brightness.light,
    primaryColor: Colors.blue);

bool _light = true;

class _DarkLighthtmeState extends State<DarkLighthtme> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: _darktheme,
      theme: _light ? _lighttheme : _darktheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('App bar'),
          centerTitle: true,
        ),
        body: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Enter text'),
            ),
            RaisedButton(child: Text('Click me'), onPressed: () {}),
            Switch(
                value: _light,
                onChanged: (state) {
                  setState(() {
                    _light = state;
                  });
                }),
          ],
        )),
      ),
    );
  }
}
