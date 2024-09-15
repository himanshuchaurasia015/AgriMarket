// import 'package:agrimarket/screens/nav_bar.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
//
// class OtpScreen extends StatefulWidget {
//   final String phoneNumber;
//
//   const OtpScreen({Key? key, required this.phoneNumber}) : super(key: key);
//
//   @override
//   _OtpScreenState createState() => _OtpScreenState();
// }
//
// class _OtpScreenState extends State<OtpScreen> {
//   String otpCode = "";
//   String? _verificationCode;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _verifyPhone();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.primaryContainer,
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.primary,
//         title: Text('OTP Verification'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Enter the OTP sent to ${widget.phoneNumber}',
//               style: TextStyle(fontSize: 18),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 20),
//             PinCodeTextField(
//               length: 6,
//               pinTheme: PinTheme(
//                 shape: PinCodeFieldShape.box,
//                 borderRadius: BorderRadius.circular(5),
//                 fieldHeight: 50,
//                 fieldWidth: 40,
//                 activeFillColor: Colors.white,
//                 inactiveFillColor: Colors.white,
//                 selectedFillColor: Colors.white,
//                 activeColor: Colors.black,
//                 inactiveColor: Colors.grey,
//                 selectedColor: Colors.blue,
//               ),
//               cursorColor: Colors.black,
//               animationDuration: Duration(milliseconds: 300),
//               backgroundColor: Colors.transparent,
//               enableActiveFill: true,
//               onChanged: (value) {
//                 setState(() {
//                   otpCode = value;
//                 });
//               },
//               onCompleted: (value) {
//                 setState(() {
//                   otpCode = value;
//                 });
//                 // You can add your verification logic here
//                 print("OTP Code Completed: $otpCode");
//               },
//               appContext: context,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Theme.of(context).colorScheme.primary,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(5)),
//                 fixedSize: Size(350, 54),
//               ),
//               onPressed: () {
//                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavBar(),));
//                 // You can add your verification logic here
//                 print("Entered OTP Code: $otpCode");
//               },
//               child: Text(
//                 'Verify OTP',
//                 style: TextStyle(
//                     fontFamily: 'lato',
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   _verifyPhone() async {
//     print("processing-----------------------");
//     await FirebaseAuth.instance.verifyPhoneNumber(
//       phoneNumber: widget.phoneNumber,
//       timeout: const Duration(seconds: 60),
//       verificationCompleted: (PhoneAuthCredential credential) {},
//       verificationFailed: (FirebaseAuthException e) {
//         if (e.code == 'invalid-phone-number') {
//           print('The provided phone number is not valid.');
//         }
//       },
//       codeSent: (String verificationId, int? resendToken) {},
//       codeAutoRetrievalTimeout: (String verificationId) {},
//     );
//   }
//
// }
//
//
//



import 'package:agrimarket/screens/nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;

  const OtpScreen({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String otpCode = "";
  String? _verificationCode;

  @override
  void initState() {
    super.initState();
    _verifyPhone();
  }

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
              'Enter the OTP sent to ${widget.phoneNumber}',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
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
                _verifyOtp();
              },
              appContext: context,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                fixedSize: Size(350, 54),
              ),
              onPressed: _verifyOtp,
              child: Text(
                'Verify OTP',
                style: TextStyle(
                    fontFamily: 'lato',
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _verifyPhone() async {
    print("processing-----------------------");
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91${widget.phoneNumber}',
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        // If the code is auto-retrieved, this block will be called.
        await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
          if (value.user != null) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => NavBar()),
                  (route) => false,
            );
          }
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print("Verification Failed: ${e.message}");
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          _verificationCode = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          _verificationCode = verificationId;
        });
      },
    );
  }

  void _verifyOtp() async {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => NavBar()),
          (route) => false,
    );
    if (otpCode.isNotEmpty && _verificationCode != null) {
      try {
        // Create a PhoneAuthCredential using the verification code
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: _verificationCode!,
          smsCode: otpCode,
        );

        // Sign in using the credential
        await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
          if (value.user != null) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => NavBar()),
                  (route) => false,
            );
          }
        });
      } catch (e) {
        print("OTP Verification Failed: $e");
        // Show error message if needed
      }
    } else {
      print("Invalid OTP or verification code is null");
    }
  }
}
