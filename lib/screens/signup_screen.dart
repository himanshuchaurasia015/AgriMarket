// ignore_for_file: prefer_const_constructors

import 'package:agrimarket/screens/login_screen.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isPassword = false;
  bool numPad = false;

  Widget customTextField(String hintText,
      {bool isPassword = false, bool numPad = false}) {
    return TextField(
      obscureText: isPassword,
      obscuringCharacter: '•',
      keyboardType: numPad ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.black, width: 1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Container(
        height: 712,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(100),
            bottomRight: Radius.circular(100),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 80),
              Image.asset("assets/images/greenbg.png"),
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    customTextField("Name"),
                    SizedBox(height: 16),
                    customTextField("Email"),
                    SizedBox(height: 16),
                    customTextField("Phone", numPad: true),
                    SizedBox(height: 16),
                    customTextField("Password", isPassword: true),
                    SizedBox(height: 16),
                    customTextField("Re-Enter password", isPassword: true),
                    SizedBox(height: 30),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                                Theme.of(context).colorScheme.primary),
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            fixedSize: WidgetStatePropertyAll(Size(350, 54))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ));
                        },
                        child: Text("Create Account",
                            style: TextStyle(
                                fontFamily: 'lato',
                                fontWeight: FontWeight.bold,
                                color: Colors.white))),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ));
                        },
                        child: Text("Already have an account? Sign In"))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
