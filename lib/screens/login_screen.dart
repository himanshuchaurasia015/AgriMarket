import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Widget customTextField(String hintText) {
    return TextField(
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
                      customTextField("Password"),
                      Padding(
                        padding: const EdgeInsets.only(left: 230),
                        child: Text("Forget Password"),
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
                          onPressed: () {},
                          child: Text("Log in",
                              style: TextStyle(
                                  fontFamily: 'lato',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))),
                      Text("Don’t have an account? Sign up")
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
