import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wsa_project_1/providers/AuthProvider.dart';
import 'package:wsa_project_1/screens/authWrapper.dart';
import 'package:wsa_project_1/screens/loginScreen.dart';
import 'package:wsa_project_1/screens/signUpScreen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'WSA Project 1',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AuthWrapper(),
      ),
    );
  }
}
