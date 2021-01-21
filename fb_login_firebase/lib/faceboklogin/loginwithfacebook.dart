import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class Loginwithfacebook extends StatefulWidget {
  @override
  _LoginwithfacebookState createState() => _LoginwithfacebookState();
}

class _LoginwithfacebookState extends State<Loginwithfacebook> {
  bool islogin = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  FacebookLogin _facebooklogin = FacebookLogin();
  User _user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: islogin
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(_user.photoURL),
                  ),
                  Text(
                    _user.displayName,
                  ),
                  OutlineButton(
                    onPressed: () {
                      signout();
                    },
                    child: Text('logout'),
                  ),
                ],
              ),
            )
          : Center(
              child: OutlineButton(
                onPressed: () async {
                  await _handlelogin();
                },
                child: Text('Login with Facebook'),
              ),
            ),
    );
  }

  Future _handlelogin() async {
    FacebookLoginResult result = await _facebooklogin.logIn(['email']);
    switch (result.status) {
      case FacebookLoginStatus.cancelledByUser:
        break;
      case FacebookLoginStatus.error:
        break;
      case FacebookLoginStatus.loggedIn:
        try {
          await loginWithfacebook(result);
        } catch (e) {
          print(e);
        }
        break;
    }
  }

  Future loginWithfacebook(FacebookLoginResult result) async {
    final FacebookAccessToken accessToken = result.accessToken;
    AuthCredential credential =
        FacebookAuthProvider.credential(accessToken.token);
    var a = await _auth.signInWithCredential(credential);
    setState(() {
      islogin = true;
      _user = a.user;
      print(_user);
    });
  }

  Future<void> signout() async {
    await _auth.signOut().then((onvalue) {
      setState(() {
        _facebooklogin.logOut();
        islogin = false;
      });
    });
  }
}
