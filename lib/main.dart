import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_notes/Screens/home_screen.dart';
import 'package:my_notes/Screens/login_screen.dart';
import 'package:my_notes/Screens/sign_in_screen.dart';

/// beacause therr are many log function so this line will make this log function is the only function available in devtools

void main() async {
  /// do the authintication befor anything else
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((_) {
    print("Firebase initialized successfully.");
  }).catchError((error) {
    print("Firebase initialization error: $error");
  });
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: {
      '/signin': (context) => const SignInScreen(),
      '/login': (context) => const LoginScreen(),
    }, debugShowCheckedModeBanner: false, home: const HomeScreen());
  }
}
