import 'package:flutter/material.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        title: Image.asset('assets/images/blackbg.png',
            width: 180, fit: BoxFit.contain),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80, left: 8, right: 8),
            child: Container(
                height: 450,
                width: 380,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.green, width: 2)),
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Image.asset("assets/images/sign.png"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Issue",
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 16.0, bottom: 16.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Describe",
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                  Theme.of(context).colorScheme.primary),
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                              fixedSize: WidgetStatePropertyAll(Size(350, 54))),
                          onPressed: () {},
                          child: Text("Submit",
                              style: TextStyle(
                                  fontFamily: 'lato',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))),
                    ],
                  ),
                )),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "---------------------------OR---------------------------",
            style: TextStyle(
              letterSpacing: 0, // No spacing between characters
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                          Theme.of(context).colorScheme.primary),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                      fixedSize: WidgetStatePropertyAll(Size(150, 54))),
                  onPressed: () {},
                  child: Text("Email",
                      style: TextStyle(
                          fontFamily: 'lato',
                          fontWeight: FontWeight.bold,
                          color: Colors.white))),
              SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                          Theme.of(context).colorScheme.primary),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                      fixedSize: WidgetStatePropertyAll(Size(150, 54))),
                  onPressed: () {},
                  child: Text("Contact Us",
                      style: TextStyle(
                          fontFamily: 'lato',
                          fontWeight: FontWeight.bold,
                          color: Colors.white))),
            ],
          )
        ],
      ),
    );
  }
}
