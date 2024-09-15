// ignore_for_file: library_prefixes

import 'package:agrimarket/screens/otp_screen.dart';
import 'package:agrimarket/screens/type_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen2 extends StatefulWidget {
  final String? userType;

  const LoginScreen2({Key? key, this.userType}) : super(key: key);

  @override
  _LoginScreen2State createState() => _LoginScreen2State();
}

class _LoginScreen2State extends State<LoginScreen2> {
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  Widget customTextField(String hintText, TextEditingController controller,
      {bool isPassword = false,
      TextInputType keyboardType = TextInputType.text}) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      obscuringCharacter: '•',
      keyboardType: keyboardType,
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
                  isPassword ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    isPassword = !isPassword;
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

  _sendOtp() async {
    if (_formKey.currentState?.validate() != true) {
      return;
    }

    final phoneNumber = _phoneController.text.trim();

    setState(() {
      isLoading = true;
    });

    try {
      // Your OTP sending logic here
      // For example, Firebase Auth for verification:
      // await FirebaseAuth.instance.verifyPhoneNumber(
      //   phoneNumber: phoneNumber,
      //   verificationCompleted: (PhoneAuthCredential credential) {},
      //   verificationFailed: (FirebaseAuthException e) {},
      //   codeSent: (String verificationId, int? resendToken) {},
      //   codeAutoRetrievalTimeout: (String verificationId) {},
      // );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OtpScreen(),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred. Please try again.')),
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
                        customTextField("Mobile Number", _phoneController,
                            keyboardType: TextInputType.number),
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
                                onPressed: _sendOtp,
                                child: Text(
                                  "Send OTP",
                                  style: TextStyle(
                                      fontFamily: 'lato',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
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
