import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wsa_project_1/providers/AuthProvider.dart';
import 'package:wsa_project_1/styles/colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthProvider>(
        builder: (context, auth, child) => SafeArea(
          child: Center(
            child: SingleChildScrollView(
                child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "PandaServe",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Color(0xFF353343)),
                        ),
                        const Text(
                          "Black, white and fluffy",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xFFacafb6)),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: TextField(
                            controller: auth.signUpFirstNameController,
                            obscureText: false,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                fillColor: Color(0xfff6f6f6),
                                labelText: 'First name',
                                filled: true),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: TextField(
                            controller: auth.signUpLastNameController,
                            obscureText: false,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                fillColor: Color(0xfff6f6f6),
                                labelText: 'Last name',
                                filled: true),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: TextField(
                            controller: auth.signUpEmailController,
                            obscureText: false,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                fillColor: Color(0xfff6f6f6),
                                labelText: 'Email',
                                filled: true),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextField(
                            controller: auth.signUpPasswordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                fillColor: Color(0xfff6f6f6),
                                labelText: 'Password',
                                filled: true),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextField(
                            controller: auth.signUpConfirmPasswordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                fillColor: Color(0xfff6f6f6),
                                labelText: 'Confirm password',
                                filled: true),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 24.0, bottom: 18.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: TextButton(
                              onPressed: () async {
                                // showAlertDialog(context);
                                if (auth.signUpFirstNameController.text
                                            .trim() !=
                                        "" &&
                                    auth.signUpLastNameController.text.trim() !=
                                        "" &&
                                    auth.signUpEmailController.text.trim() !=
                                        "" &&
                                    auth.signUpPasswordController.text.trim() !=
                                        "" &&
                                    auth.signUpConfirmPasswordController.text
                                            .trim() !=
                                        "") {
                                  if (auth.signUpPasswordController.text
                                          .trim() !=
                                      auth.signUpConfirmPasswordController.text
                                          .trim()) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                            content: Text(
                                      "Passwords do not match",
                                      textAlign: TextAlign.center,
                                    )));
                                  }
                                  // Sign up flow
                                  bool isSignedUp = await auth.signUp();

                                  if (isSignedUp) {
                                    auth.resetSignUpFields();
                                    showAlertDialog(context);
                                  }
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                          content: Text(
                                    "All fields must be filled",
                                    textAlign: TextAlign.center,
                                  )));
                                }
                                // bool isSignedUp = await auth.signUp();
                                // if (isSignedUp) {}
                              },
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.all(16)),
                                  backgroundColor: MaterialStateProperty.all(
                                      appColors.lightGreen)),
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 2.0,
                                // width: 130.0,
                                color: appColors.lightGreen,
                              ),
                            ),
                            const Expanded(
                                flex: 4,
                                child: Text(
                                  "Already have an account?",
                                  style: TextStyle(color: appColors.lightGreen),
                                  textAlign: TextAlign.center,
                                )),
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 2.0,
                                // width: 130.0,
                                color: appColors.lightGreen,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: appColors.lightGreen)),
                                // padding: const EdgeInsets.all(10.0),
                                child: TextButton(
                                    onPressed: () {
                                      auth.setAuthState("login");
                                    },
                                    child: const Text(
                                      "Login",
                                      style: TextStyle(
                                          color: appColors.lightGreen),
                                    )),
                              ),
                            ))
                          ],
                        )
                      ]),
                ]),
              ),
            )),
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Sign Up Successful!"),
      content: Text("Proceed to login with your new account"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
