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
        title: 'Flutter Login Page',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColor: Color(0xff4c99cd),
          accentColor: Colors.red,

          textTheme: const TextTheme(
            displayLarge: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
            headlineSmall: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            titleLarge: TextStyle(fontSize: 36, fontStyle: FontStyle.italic),
            bodyLarge: TextStyle(
              fontSize: 20,
            ),
            bodyMedium: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        home: Login());
  }
}
