import 'package:bloc/bloc/register_bloc.dart';
import 'package:bloc/screen/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  bool isvisible = true;
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<RegisterBloc>(context, listen: false);

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
                "Register ",
                textScaleFactor: 1.5,
              ),
              SizedBox(
                height: 30,
              ),
              StreamBuilder<String>(
                  stream: bloc.name,
                  builder: (context, snapshot) {
                    return TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "Enter Name",
                          labelText: "Enter Name",
                          errorText: snapshot.error,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onChanged: (value) => bloc.changename(value),
                    );
                  }),
              SizedBox(
                height: 20,
              ),
              StreamBuilder<String>(
                  stream: bloc.email,
                  builder: (context, snapshot) {
                    return TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "Enter Email",
                          labelText: "Enter Email",
                          errorText: snapshot.error,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onChanged: bloc.changeemail,
                    );
                  }),
              SizedBox(
                height: 20,
              ),
              StreamBuilder<String>(
                  stream: bloc.phone,
                  builder: (context, snapshot) {
                    return TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          hintText: "Enter Phone",
                          labelText: "Enter Phone",
                          errorText: snapshot.error,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onChanged: (value) => bloc.changephone,
                    );
                  }),
              SizedBox(
                height: 20,
              ),
              StreamBuilder<String>(
                  stream: bloc.password,
                  builder: (context, snapshot) {
                    return TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "Passwod",
                          labelText: "Passwod",
                          errorText: snapshot.error,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onChanged: bloc.changepassword,
                    );
                  }),
              SizedBox(
                height: 20,
              ),
              StreamBuilder<String>(
                  stream: bloc.password,
                  builder: (context, snapshot) {
                    return TextFormField(
                      obscureText: isvisible,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "Confirm password",
                          labelText: "Confirm password",
                          errorText: snapshot.error,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          suffixIcon: IconButton(
                              icon: isvisible
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  isvisible = !isvisible;
                                });
                              })),
                      onChanged: bloc.changeconfirmpassword,
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
                    text: "Already have an Account?",
                    style: TextStyle(color: Colors.black)),
                WidgetSpan(
                    child: SizedBox(
                  width: 5,
                )),
                TextSpan(
                    text: "Login Here",
                    style: TextStyle(color: Colors.red),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => LoginPage()));
                      }),
              ]))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildbutton() {
    final bloc = Provider.of<RegisterBloc>(context, listen: false);

    return StreamBuilder<Object>(
        stream: bloc.isValid,
        builder: (context, snapshot) {
          return RaisedButton(
              color: snapshot.hasError || !snapshot.hasData
                  ? Colors.grey
                  : Colors.teal[200],
              child: Text("Register"),
              onPressed: snapshot.hasError || !snapshot.hasData
                  ? null
                  : () {
                      bloc.submit();
                    });
        });
  }
}
