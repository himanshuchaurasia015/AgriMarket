// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:agrimarket/firebase_services/splash_screenService.dart';
import 'package:agrimarket/screens/nav_bar.dart';
import 'package:agrimarket/screens/type_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  SplashService splashScreen = SplashService();
  static const String KEYLOGIN = "login";
  @override
  void initState() {
    super.initState();

    whereToGo();
    // splashScreen.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/greenbg.png'), // Splash screen logo
      ),
      backgroundColor: Color(0xFFD7FBE8), // Background color
    );
  }

  Future<void> whereToGo() async {
    var sharedpref = await SharedPreferences.getInstance();

    var isLoggedIN = sharedpref.getBool(KEYLOGIN);

    Timer(Duration(seconds: 2), () {
      if (isLoggedIN != null) {
        if (isLoggedIN) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => NavBar()),
          );
        } else {
          Navigator.pop(
            context,
            MaterialPageRoute(builder: (context) => TypeScreen()),
          );
        }
      } else {
        Navigator.pop(
          context,
          MaterialPageRoute(builder: (context) => TypeScreen()),
        );
      }
    });
  }
}
