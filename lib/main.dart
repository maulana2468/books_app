import 'package:book_app/ui/login_screen.dart';
import 'package:book_app/ui/main_menu.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? token;

  @override
  void initState() {
    super.initState();
    getToken();
  }

  void getToken() async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString("TOKEN_APP");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: (token == null) ? const LoginScreen() : const MainMenu(),
    );
  }
}
