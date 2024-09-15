// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:agrimarket/screens/login_screen.dart';

class TypeScreen extends StatefulWidget {
  const TypeScreen({super.key});

  @override
  State<TypeScreen> createState() => _TypeScreenState();
}

class _TypeScreenState extends State<TypeScreen> {
  String? userType; // Variable to store the user type (Farmer or Buyer)

  // Method to handle navigation to the LoginScreen with the user type
  void _navigateToLoginScreen(String selectedType) {
    setState(() {
      userType = selectedType; // Update the userType variable
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(
          userType: userType!, // Pass the userType to the next screen
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Center(
        child: SizedBox(
          height: 600,
          width: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Select user type",
                style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'roboto'),
              ),
              // Farmer Selection
              InkWell(
                onTap: () {
                  _navigateToLoginScreen('farmer');
                },
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(34),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset("assets/images/farmer.png"),
                      Text(
                        "Farmer",
                        style: TextStyle(
                          fontSize: 48,
                          fontFamily: 'lato',
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primaryContainer,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Buyer Selection
              InkWell(
                onTap: () {
                  _navigateToLoginScreen('buyer');
                },
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(34),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        "assets/images/buyer.png",
                        width: 190,
                      ),
                      Text(
                        "Buyer",
                        style: TextStyle(
                          fontSize: 48,
                          fontFamily: 'lato',
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primaryContainer,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
