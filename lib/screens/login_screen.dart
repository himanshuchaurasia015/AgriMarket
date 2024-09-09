import 'package:agrimarket/screens/forget_password_screen.dart';
import 'package:agrimarket/screens/nav_bar.dart';
import 'package:agrimarket/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPassword = false;

  Widget customTextField(String hintText, {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      obscuringCharacter: '•',
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
      body: Padding(
        padding: const EdgeInsets.only(top: 170),
        child: Container(
          height: 712,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(100),
              topRight: Radius.circular(100),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 100),
                Image.asset("assets/images/greenbg.png"),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      SizedBox(height: 50),
                      customTextField("Email/Phone"),
                      SizedBox(height: 16),
                      customTextField("Password", isPassword: true),
                      Padding(
                        padding: const EdgeInsets.only(left: 230),
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ForgetPasswordScreen()),
                              );
                            },
                            child: Text("Forget Password")),
                      ),
                      SizedBox(height: 50),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                  Theme.of(context).colorScheme.primary),
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                              fixedSize: WidgetStatePropertyAll(Size(350, 54))),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => NavBar()),
                              (Route<dynamic> route) => false,
                            );
                          },
                          child: Text("Log in",
                              style: TextStyle(
                                  fontFamily: 'lato',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupScreen()));
                          },
                          child: Text("Don’t have an account? Sign up"))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
