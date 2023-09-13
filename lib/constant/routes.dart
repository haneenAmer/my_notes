import 'package:flutter/material.dart';
import 'package:my_notes/Screens/login_screen.dart';
import 'package:my_notes/Screens/sign_in_screen.dart';

class AppRoutes extends StatelessWidget {
  const AppRoutes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// defenition of the login and sign in rou (name of the route) and the value must be
      /// fuction (navigate to the page)
      routes: {
        '/login': (context) => const LoginScreen(),

        ///return instance of login screen
        '/signin': (context) => const SignInScreen(),

        ///return instance of signin screen
      },
    );
  }
}
