import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggedin = false;
  Map userprofile;
  _loginfb() {}
  _logout() {}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: isLoggedin
              ? Column(
                  children: [
                    Image.network(
                      'https://picsum.photos/200/300',
                      height: 50,
                      width: 50,
                    ),
                    Text(""),
                    OutlineButton(
                        child: Text('Logout'),
                        onPressed: () {
                          _logout();
                        })
                  ],
                )
              : OutlineButton(
                  child: Text('Login With Facebook'),
                  onPressed: () {
                    _loginfb();
                  },
                ),
        ),
      ),
    );
  }
}
