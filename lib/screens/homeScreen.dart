import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wsa_project_1/providers/AuthProvider.dart';
import 'package:wsa_project_1/styles/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthProvider>(
        builder: (context, auth, child) => Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Home screen"),
            TextButton(
              onPressed: () {
                auth.setAuthState("login");
                auth.appToken = "";
              },
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12)),
                  backgroundColor:
                      MaterialStateProperty.all(appColors.lightGreen)),
              child: const Text(
                "Sign Out",
                style: TextStyle(color: appColors.appWhite),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
