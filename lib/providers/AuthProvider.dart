import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

import 'package:wsa_project_1/models/user.dart';
import 'package:wsa_project_1/models/product.dart';

class AuthProvider with ChangeNotifier {
  bool isLoggedIn = false;
  String authState = "login";

  // login controllers
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  // Sign up controllers
  TextEditingController signUpEmailController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();
  TextEditingController signUpConfirmPasswordController =
      TextEditingController();
  TextEditingController signUpFirstNameController = TextEditingController();
  TextEditingController signUpLastNameController = TextEditingController();

  // app vars
  String authErrors = "";
  User? user;
  String appToken = "";

  // app urls
  final loginUrl = "https://pandaserve.ew.r.appspot.com/api/v1/login";
  final registerUrl = "https://pandaserve.ew.r.appspot.com/ap1/v1/register";

  setAuthState(String state) {
    authState = state;
    notifyListeners();
  }

  setLoggedIn(bool loggedIn) {
    isLoggedIn = loggedIn;
    notifyListeners();
  }

  login() async {
    try {
      final response = await post(Uri.parse(loginUrl),
          body: jsonEncode({
            "email": loginEmailController.text.trim(),
            "password": loginPasswordController.text.trim(),
          }),
          headers: {"Content-Type": "application/json; charset=UTF-8"});

      if (response.statusCode == 200) {
        // print(response.body);
        final resObj = json.decode(response.body);

        print("/////////////////////////////////");
        print(resObj);

        appToken = resObj["data"]["token"];

        notifyListeners();
        return true;
      } else {
        // authErrors = json.decode(response.body);

        print("/////////////////////////////////1111111");
        print(response.body);

        notifyListeners();
        return false;
      }
    } catch (e) {
      print("/////////////////////////////////222222");
      print(e.toString());
      notifyListeners();
      return false;
    }
  }

  signUp() async {
    print("Signing up..................................");
    try {
      final response = await post(Uri.parse(registerUrl),
          body: jsonEncode({
            "first_name": signUpFirstNameController.text.trim(),
            "last_name": signUpLastNameController.text.trim(),
            "email": signUpEmailController.text.trim(),
            "password": signUpEmailController.text.trim(),
          }),
          headers: {"Content-Type": "application/json; charset=UTF-8"});

      if (response.statusCode == 200) {
        final resObj = json.decode(response.body);
        print("/////////////////////////////////");
        print(resObj);

        notifyListeners();
        return true;
      } else {
        authErrors = json.decode(response.body);
        print("/////////////////////////////////aaaaa");
        print(authErrors);
        notifyListeners();
        return false;
      }
    } catch (e) {
      authErrors = e.toString();
      print("/////////////////////////////////11111");
      print(e);
      notifyListeners();
      return false;
    }
  }

  resetSignUpFields() {
    signUpConfirmPasswordController.text = "";
    signUpEmailController.text = "";
    signUpFirstNameController.text = "";
    signUpLastNameController.text = "";
    signUpPasswordController.text = "";
  }

  resetLoginFields() {
    loginPasswordController.text = "";
    loginEmailController.text = "";
  }
}
