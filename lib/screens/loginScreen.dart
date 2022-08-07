import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wsa_project_1/providers/AuthProvider.dart';
import 'package:wsa_project_1/styles/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthProvider>(
        builder: (context, auth, child) => SafeArea(
            child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      isLoading
                          ? Column(
                              children: const [
                                CircularProgressIndicator(
                                  color: appColors.lightGreen,
                                ),
                                SizedBox(
                                  height: 12,
                                )
                              ],
                            )
                          : const SizedBox(
                              height: 0,
                            ),
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
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0, top: 32),
                        child: TextField(
                          controller: auth.loginEmailController,
                          obscureText: false,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              fillColor: Color(0xfff6f6f6),
                              labelText: 'Email',
                              filled: true),
                        ),
                      ),
                      TextField(
                        obscureText: true,
                        controller: auth.loginPasswordController,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            fillColor: Color(0xfff6f6f6),
                            labelText: 'Password',
                            filled: true),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24.0, bottom: 18.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    appColors.lightGreen),
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.all(16))),
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                              });
                              if (auth.loginEmailController.text.trim() != "" &&
                                  auth.loginPasswordController.text.trim() !=
                                      "") {
                                bool loginResult = await auth.login();
                                if (loginResult) {
                                  auth.setAuthState("loggedIn");
                                  auth.loginEmailController.text = "";
                                  auth.loginPasswordController.text = "";

                                  setState(() {
                                    isLoading = false;
                                  });
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                          content: Text(
                                    "Invalid login credentials",
                                    textAlign: TextAlign.center,
                                  )));

                                  setState(() {
                                    isLoading = false;
                                  });
                                }
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                        content: Text(
                                  "All fields must be filled",
                                  textAlign: TextAlign.center,
                                )));

                                setState(() {
                                  isLoading = false;
                                });
                              }
                            },
                            child: const Text(
                              "Login",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
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
                                "Don't have an account?",
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
                                    auth.setAuthState("signUp");
                                  },
                                  child: const Text(
                                    "Sign Up",
                                    style:
                                        TextStyle(color: appColors.lightGreen),
                                  )),
                            ),
                          ))
                        ],
                      )
                    ]),
              ),
            ]),
          ),
        )),
      ),
    );
  }
}
