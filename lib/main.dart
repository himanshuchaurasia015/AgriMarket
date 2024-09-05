// ignore_for_file: prefer_const_constructors

import 'package:agrimarket/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'AgriMarket',
        theme: ThemeData(
          fontFamily: 'Roboto',
          textTheme: TextTheme(
            bodyLarge: TextStyle(fontFamily: 'Roboto'),
            bodyMedium: TextStyle(fontFamily: 'Lato'),
            displayLarge:
                TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),
            displayMedium:
                TextStyle(fontFamily: 'Lato', fontWeight: FontWeight.bold),
          ),
          colorScheme: ColorScheme(
            primary: Color(0xFF3A8B19),
            primaryContainer: Color(0xFFD7FBE8),
            secondary: Color(0xFF3A8B19),
            surface: Colors.white,
            onPrimary: Colors.white,
            onSecondary: Colors.white,
            onSurface: Colors.black,
            error: Colors.red,
            onError: Colors.white,
            brightness: Brightness.light,
          ),
          useMaterial3: true,
        ),
        home: HomeScreen());
  }
}
