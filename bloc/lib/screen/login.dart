import 'package:bloc/bloc/Login_bloc.dart';
import 'package:bloc/screen/register.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<LoginBloc>(context, listen: false);
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Container(
          color: Colors.teal[50],
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login",
                textScaleFactor: 1.5,
              ),
              SizedBox(
                height: 30,
              ),
              StreamBuilder<String>(
                  stream: bloc.loginemail,
                  builder: (context, snapshot) {
                    return TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "Enter Email",
                          labelText: "Enter Email",
                          errorText: snapshot.error,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onChanged: bloc.changeloginemail,
                    );
                  }),
              SizedBox(
                height: 20,
              ),
              StreamBuilder<String>(
                  stream: bloc.loginpassword,
                  builder: (context, snapshot) {
                    return TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "password",
                          labelText: "password",
                          errorText: snapshot.error,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onChanged: bloc.changeloginpassword,
                    );
                  }),
              SizedBox(
                height: 20,
              ),
              _buildbutton(),
              SizedBox(
                height: 20,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Need an Account?",
                    style: TextStyle(color: Colors.black)),
                WidgetSpan(
                    child: SizedBox(
                  width: 5,
                )),
                TextSpan(
                    text: "Rigister Here",
                    style: TextStyle(color: Colors.red),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Register()));
                      }),
              ]))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildbutton() {
    final bloc = Provider.of<LoginBloc>(context, listen: false);
    return StreamBuilder<Object>(
        stream: bloc.isValid,
        builder: (context, snapshot) {
          return RaisedButton(
              color: snapshot.hasError || !snapshot.hasData
                  ? Colors.grey
                  : Colors.teal[200],
              child: Text("Login"),
              onPressed: snapshot.hasError || !snapshot.hasData
                  ? null
                  : () {
                      bloc.submit();
                    });
        });
  }
}
