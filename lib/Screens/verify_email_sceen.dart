import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_notes/firebase_options.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerhfyEmailScreenState();
}

class _VerhfyEmailScreenState extends State<VerifyEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text('verify email')),
      body: FutureBuilder(
          future: Firebase.initializeApp(
              options: DefaultFirebaseOptions.currentPlatform),
          builder: (context, snapshot) {
            return Column(children: [
              const Text('please verify your email'),
              TextButton(
                  onPressed: () async {
                    final user = FirebaseAuth.instance.currentUser;
                    await user?.sendEmailVerification();
                  },
                  child: const Text('end email verification')),
            ]);
          }),
    ));
  }
}
