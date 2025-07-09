import 'package:flutter/material.dart';
import 'package:instagram_clone/Pages/logIn_page.dart';
import 'package:instagram_clone/Pages/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finstagram',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      initialRoute: 'login',
      routes: {
        'register': (context) => RegisterPage(),
        'login': (context) => LogInPage(),
      },
    );
  }
}
