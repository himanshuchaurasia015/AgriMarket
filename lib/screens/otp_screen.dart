import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OTP Verification',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OtpScreen(),
    );
  }
}

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String otpCode = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text('OTP Verification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter the OTP sent to your mobile number',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            PinCodeTextField(
              length: 6,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: Colors.white,
                inactiveFillColor: Colors.white,
                selectedFillColor: Colors.white,
                activeColor: Colors.black,
                inactiveColor: Colors.grey,
                selectedColor: Colors.blue,
              ),
              cursorColor: Colors.black,
              animationDuration: Duration(milliseconds: 300),
              backgroundColor: Colors.transparent,
              enableActiveFill: true,
              onChanged: (value) {
                setState(() {
                  otpCode = value;
                });
              },
              onCompleted: (value) {
                setState(() {
                  otpCode = value;
                });
                // You can add your verification logic here
                print("OTP Code Completed: $otpCode");
              },
              appContext: context, // Add this line
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // You can add your verification logic here
                print("Entered OTP Code: $otpCode");
              },
              child: Text('Verify OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
