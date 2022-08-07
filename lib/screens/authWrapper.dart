import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wsa_project_1/providers/AuthProvider.dart';
import 'package:wsa_project_1/screens/homeScreen.dart';
import 'package:wsa_project_1/screens/loginScreen.dart';
import 'package:wsa_project_1/screens/signUpScreen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = Provider.of<AuthProvider>(context).isLoggedIn;
    String authState = Provider.of<AuthProvider>(context).authState;

    if (authState == "loggedIn") {
      return const HomeScreen();
    } else if (authState == "signUp") {
      return const SignUpScreen();
    } else {
      return const LoginScreen();
    }
  }
}
