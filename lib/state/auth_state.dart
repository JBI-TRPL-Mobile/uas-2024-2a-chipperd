import 'package:flutter/material.dart';

class AuthState extends ChangeNotifier {
  String _email = '';
  String _password = '';

  String get email => _email;
  set email(String value) {
    _email = value;
    notifyListeners();
  }

  String get password => _password;
  set password(String value) {
    _password = value;
    notifyListeners();
  }

  void signIn() {
    // Logika sederhana untuk sign-in
    if (_email.isNotEmpty && _password.isNotEmpty) {
      print('Signed in with Email: $_email, Password: $_password');
    } else {
      print('Email or Password is empty');
    }
  }
}
