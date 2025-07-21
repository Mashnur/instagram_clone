import 'package:flutter/material.dart';
import 'package:instagram_clone/Pages/Home_Page.dart';
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
        primarySwatch: Colors.red,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.red, // 👈 set your desired color
          foregroundColor: Colors.white, // 👈 for title/icon color
        ),
      ),
      initialRoute: 'home',
      routes: {
        'register': (context) => RegisterPage(),
        'login': (context) => LogInPage(),
        'home': (context) => HomePage(),
      },
    );
  }
}
