// ignore_for_file: prefer_const_constructors

import 'package:agrimarket/firebase_options.dart';
import 'package:agrimarket/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  } catch (e) {
    print("Firebase initialization error: $e");
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
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
        home: SplashScreen());
  }
}
