import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late final TextEditingController email;
  late final TextEditingController password;
  @override
  void initState() {
    email = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(236, 64, 122, 1),
          title: const Text('Signin '),
        ),
        backgroundColor: Colors.white,
        body: Column(children: [
          TextField(
            controller: email,
            decoration: const InputDecoration(
              hintText: 'Enter your email',
            ),
          ),
          TextField(
            controller: password,
            decoration: InputDecoration(hintText: 'Enter password'),
          ),
          TextButton(onPressed: () {}, child: const Text('pressed'))
        ]),
      )),
    );
  }
}
