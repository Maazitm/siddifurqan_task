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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBo2SpEQ9T70jZLv5FnU_X3lLYRMglrT7c',
    appId: '1:356183898260:web:b1458cb22e873676c81c81',
    messagingSenderId: '356183898260',
    projectId: 'siddi-furqan',
    authDomain: 'siddi-furqan.firebaseapp.com',
    storageBucket: 'siddi-furqan.appspot.com',
    measurementId: 'G-VT62XVKWQH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDOZVgnZfBt71fRVgBXXr3IOfJDW_Bvvew',
    appId: '1:356183898260:android:bf163f08d1163b39c81c81',
    messagingSenderId: '356183898260',
    projectId: 'siddi-furqan',
    storageBucket: 'siddi-furqan.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDk1dqQj03KAcaZg2bG9xSm1IIkhU2MaQQ',
    appId: '1:356183898260:ios:99fc2bc85e6c17ffc81c81',
    messagingSenderId: '356183898260',
    projectId: 'siddi-furqan',
    storageBucket: 'siddi-furqan.appspot.com',
    iosBundleId: 'com.example.siddifurqanTask',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDk1dqQj03KAcaZg2bG9xSm1IIkhU2MaQQ',
    appId: '1:356183898260:ios:99fc2bc85e6c17ffc81c81',
    messagingSenderId: '356183898260',
    projectId: 'siddi-furqan',
    storageBucket: 'siddi-furqan.appspot.com',
    iosBundleId: 'com.example.siddifurqanTask',
  );
}