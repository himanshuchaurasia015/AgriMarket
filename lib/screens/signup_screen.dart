import 'package:agrimarket/screens/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  final String? userType; // Accept userType in the constructor

  const SignupScreen({super.key, this.userType});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _rePasswordController = TextEditingController();

  bool isPassword = false;
  bool numPad = false;

  Widget customTextField(String hintText, TextEditingController controller,
      {bool isPassword = false, bool numPad = false}) {
    return TextField(
      controller: controller,
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

  _signup() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final phone = _phoneController.text.trim();
    final password = _passwordController.text.trim();
    final rePassword = _rePasswordController.text.trim();

    if (password != rePassword) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Passwords do not match")),
      );
      return;
    }

    try {
      // Create user with email and password
      final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Store additional user details in Firestore
      await FirebaseFirestore.instance.collection('users').doc(userCredential.user?.uid).set({
        'name': name,
        'email': email,
        'phone': phone,
      });
      
      // Navigate to login screen or home screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(userType: widget.userType), // Pass userType
        ),
      );
    } catch (e) {
      // Handle errors here
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
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
                    customTextField("Name", _nameController),
                    SizedBox(height: 16),
                    customTextField("Email", _emailController),
                    SizedBox(height: 16),
                    customTextField("Phone", _phoneController, numPad: true),
                    SizedBox(height: 16),
                    customTextField("Password", _passwordController, isPassword: true),
                    SizedBox(height: 16),
                    customTextField("Re-Enter password", _rePasswordController, isPassword: true),
                    SizedBox(height: 30),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                              Theme.of(context).colorScheme.primary),
                          shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          fixedSize: WidgetStateProperty.all(Size(350, 54))),
                      onPressed: _signup,
                      child: Text("Create Account",
                          style: TextStyle(
                              fontFamily: 'lato',
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(userType: widget.userType),
                          ),
                        );
                      },
                      child: Text("Already have an account? Sign In")
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
