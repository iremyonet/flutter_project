import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/login-page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elektraweb Opeator Login',
        debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme:
            GoogleFonts.josefinSansTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.blue,
      ),
      home: LoginPage()
    );
  }
}



