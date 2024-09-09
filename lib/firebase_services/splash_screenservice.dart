import 'dart:async';
import 'package:flutter/material.dart';
import 'package:agrimarket/screens/type_screen.dart';

class SplashService{

  void isLogin(BuildContext context){
    print("done");
    Timer(Duration(seconds: 2),
    ()=>Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>TypeScreen()
    )));
  }
}