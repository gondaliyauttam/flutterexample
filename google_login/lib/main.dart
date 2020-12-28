import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Thirdpage(),
    );
  }
}

class Secondpage extends StatefulWidget {
  @override
  _SecondpageState createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage> {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  bool isloggedin = false;

  _login() async {
    try {
      await _googleSignIn.signIn();
      setState(() {
        isloggedin = true;
      });
    } catch (error) {
      print(error);
    }
  }

  _logout() {
    _googleSignIn.signOut();
    setState(() {
      isloggedin = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google'),
        centerTitle: true,
      ),
      body: Center(
        child: isloggedin
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    _googleSignIn.currentUser.photoUrl,
                    height: 100,
                    width: 100,
                  ),
                  Text(_googleSignIn.currentUser.displayName),
                  Text(_googleSignIn.currentUser.email),
                  OutlineButton(
                    child: Text("Logout"),
                    onPressed: () {
                      _logout();
                    },
                  ),
                ],
              )
            : Center(
                child: OutlineButton(
                  child: Text("Login With Google"),
                  onPressed: () {
                    _login();
                  },
                ),
              ),
      ),
    );
  }
}

class Thirdpage extends StatefulWidget {
  @override
  _ThirdpageState createState() => _ThirdpageState();
}

class _ThirdpageState extends State<Thirdpage> {
  bool isloggedin = false;
  Map userprofile;
  final facebookLogin = FacebookLogin();

  _login() async {
    final result = await facebookLogin.logIn(['email']);
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        final graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
        final profile = JSON.jsonDecode(graphResponse.body);
        print(profile);
        setState(() {
          userprofile = profile;
          isloggedin = true;
        });
        break;

      case FacebookLoginStatus.cancelledByUser:
        setState(() => isloggedin = false);
        break;
      case FacebookLoginStatus.error:
        setState(() => isloggedin = false);
        break;
    }
  }

  _logout() {
    facebookLogin.logOut();
    setState(() {
      isloggedin = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Facebook"),
        centerTitle: true,
      ),
      body: Center(
        child: isloggedin
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    userprofile["picture"]["data"]["url"],
                    height: 100.0,
                    width: 100.0,
                  ),
                  Text(userprofile["name"]),
                  OutlineButton(
                    child: Text("Logout"),
                    onPressed: () {
                      _logout();
                    },
                  ),
                ],
              )
            : OutlineButton(
                child: Text("Login With Facebook"),
                onPressed: () {
                  _login();
                },
              ),
      ),
    );
  }
}
