// ignore_for_file: library_prefixes

import 'package:agrimarket/buyer/nav_bar_buyer.dart' as buyerNav;
import 'package:agrimarket/screens/forget_password_screen.dart';
import 'package:agrimarket/screens/nav_bar.dart' as farmerNav;
import 'package:agrimarket/screens/signup_screen.dart';
import 'package:agrimarket/screens/splash_screen.dart';
import 'package:agrimarket/screens/type_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  final String? userType;

  const LoginScreen({Key? key, this.userType}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  bool isLoading = false;

  Widget customTextField(String hintText, TextEditingController controller,
      {bool isPassword = false}) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword && !isPasswordVisible,
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
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
              )
            : null,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field cannot be empty';
        }
        if (isPassword && value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
    );
  }

  _login() async {
    if (_formKey.currentState?.validate() != true) {
      return;
    }

    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    setState(() {
      isLoading = true;
    });

    try {
      final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      var sharedPref = await SharedPreferences.getInstance();
      sharedPref.setBool(SplashScreenState.KEYLOGIN, true);

      if (widget.userType == "farmer") {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => farmerNav.NavBar()),
          (Route<dynamic> route) => false,
        );
      } else if (widget.userType == "buyer") {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => buyerNav.NavBarBuyer()),
          (Route<dynamic> route) => false,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid user type')),
        );
      }
    } on FirebaseAuthException catch (e) {
      String message;
      if (e.code == 'user-not-found') {
        message = 'No user found for this email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided.';
      } else {
        message = 'An error occurred. Please try again.';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: InkWell(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const TypeScreen()),
            );
          },
          child: const Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 150),
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
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 100),
                  Image.asset("assets/images/greenbg.png"),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text(
                          "You are logging in as a ${widget.userType ?? 'user'}",
                          style: TextStyle(fontSize: 24),
                        ),
                        SizedBox(height: 50),
                        customTextField("Email/Phone", _emailController),
                        SizedBox(height: 16),
                        customTextField("Password", _passwordController,
                            isPassword: true),
                        Padding(
                          padding: const EdgeInsets.only(left: 230),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgetPasswordScreen(),
                                ),
                              );
                            },
                            child: Text("Forget Password"),
                          ),
                        ),
                        SizedBox(height: 50),
                        isLoading
                            ? CircularProgressIndicator()
                            : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  fixedSize: Size(350, 54),
                                ),
                                onPressed: _login,
                                child: Text(
                                  "Log in",
                                  style: TextStyle(
                                      fontFamily: 'lato',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignupScreen(
                                  userType: widget.userType,
                                ),
                              ),
                            );
                          },
                          child: Text("Don’t have an account? Sign up"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
