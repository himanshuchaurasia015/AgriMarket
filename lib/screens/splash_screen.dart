// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'dart:async';

import 'package:agrimarket/buyer/nav_bar_buyer.dart';
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
  static const String KEYUSERTYPE = "userType";

  @override
  void initState() {
    super.initState();
    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/greenbg.png'), // Splash screen logo
      ),
      backgroundColor: const Color(0xFFD7FBE8), // Background color
    );
  }

  Future<void> whereToGo() async {
    try {
      SharedPreferences sharedPref = await SharedPreferences.getInstance();
      bool? isLoggedIN = sharedPref.getBool(KEYLOGIN);
      String? userType = sharedPref.getString(KEYUSERTYPE);

      // Add a delay to show the splash screen for 2 seconds
      await Future.delayed(const Duration(seconds: 2));

      if (isLoggedIN == true) {
        if (userType == "farmer") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const NavBar()),
          );
        } else if (userType == "buyer") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const NavBarBuyer()),
          );
        } else {
          // Handle unexpected userType
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const TypeScreen()),
          );
        }
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const TypeScreen()),
        );
      }
    } catch (e) {
      print('Error in whereToGo: $e');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const TypeScreen()),
      );
    }
  }
}
