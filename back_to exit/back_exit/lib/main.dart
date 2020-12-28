import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime backbuttonpresstime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WillPopScope(
      onWillPop: onwillepop,
      child: Center(
          child: Container(
              color: Colors.teal, child: Text('double clik to exit app'))),
    ));
  }

  Future<bool> onwillepop() async {
    DateTime currenttime = DateTime.now();
    bool backbutton = backbuttonpresstime == null ||
        currenttime.difference(backbuttonpresstime) > Duration(seconds: 2);
    if (backbutton) {
      backbuttonpresstime = currenttime;
      Fluttertoast.showToast(
          msg: 'double clik to exit app',
          backgroundColor: Colors.black,
          textColor: Colors.white);
      return false;
    }
    return true;
  }
}
