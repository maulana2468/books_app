import 'package:book_app/ui/login_screen.dart';
import 'package:book_app/ui/main_menu.dart';
import 'package:flutter/material.dart';

import 'data/shared_pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPrefs.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final someString = SharedPrefs.instance.getString('someString') ?? 'defaultValue';
  // await SharedPrefs.instance.setBool('someBool', true);

  final token = SharedPrefs.instance.getString("TOKEN_APP");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Books App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: (token == null) ? const LoginScreen() : MainMenu(),
    );
  }
}
