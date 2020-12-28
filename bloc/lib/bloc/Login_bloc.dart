import 'package:bloc/bloc/validation.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class LoginBloc with Validators {
  final _loginemail = BehaviorSubject<String>();
  final _loginpassword = BehaviorSubject<String>();

  //getter
  Stream<String> get loginemail => _loginemail.stream.transform(emailValidator);
  Stream<String> get loginpassword =>
      _loginpassword.stream.transform(loginPasswordValidator);

  Stream<bool> get isValid =>
      Rx.combineLatest2(loginemail, loginpassword, (a, b) => true);

  //setter
  Function(String) get changeloginemail => _loginemail.sink.add;
  Function(String) get changeloginpassword => _loginemail.sink.add;

  void submit() {
    print(_loginemail.value);
    print(_loginpassword.value);
  }

  void dispose() {
    _loginemail.close();
    _loginpassword.close();
  }
}
