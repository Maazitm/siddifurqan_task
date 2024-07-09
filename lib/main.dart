import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Customer_register_screen.dart';
import 'Login Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => CustomerRegistrationScreen(),
        '/login': (context) => LoginScreen(),
      },
    );
  }
}
