// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyD_cvJ26HcvTTVD-3Be4_paIDADnTo_bVs',
    appId: '1:830135445623:web:006cdb8535002e65ddbe72',
    messagingSenderId: '830135445623',
    projectId: 'agrimarket019',
    authDomain: 'agrimarket019.firebaseapp.com',
    storageBucket: 'agrimarket019.appspot.com',
    measurementId: 'G-BRPV9QGRML',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDY2kMfOX7Z6q6psX_7V1logFqexVSAdeo',
    appId: '1:830135445623:android:9766228851b13dc8ddbe72',
    messagingSenderId: '830135445623',
    projectId: 'agrimarket019',
    storageBucket: 'agrimarket019.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBdHQycJ9CscRWkl7bCHnB7_WtHQNn63-M',
    appId: '1:830135445623:ios:54d8897350f5e5a7ddbe72',
    messagingSenderId: '830135445623',
    projectId: 'agrimarket019',
    storageBucket: 'agrimarket019.appspot.com',
    iosBundleId: 'com.example.agrimarket',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBdHQycJ9CscRWkl7bCHnB7_WtHQNn63-M',
    appId: '1:830135445623:ios:54d8897350f5e5a7ddbe72',
    messagingSenderId: '830135445623',
    projectId: 'agrimarket019',
    storageBucket: 'agrimarket019.appspot.com',
    iosBundleId: 'com.example.agrimarket',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD_cvJ26HcvTTVD-3Be4_paIDADnTo_bVs',
    appId: '1:830135445623:web:ab3e05126cb91b16ddbe72',
    messagingSenderId: '830135445623',
    projectId: 'agrimarket019',
    authDomain: 'agrimarket019.firebaseapp.com',
    storageBucket: 'agrimarket019.appspot.com',
    measurementId: 'G-7N8EMD4G77',
  );
}
