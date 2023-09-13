import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_notes/Screens/notes_sreen.dart';
import 'package:my_notes/Screens/verify_email_sceen.dart';
import 'package:my_notes/firebase_options.dart';

/// just page that contain future builde and other stafs lke odaing text or done text

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final user = FirebaseAuth.instance.currentUser;
              if (user != null) {
                /// if the mail of the usr is veryfied print that else llet the user go to verify scren
                if (user.emailVerified) {
                  return const NotesScreen();
                } else {
                  return const VerifyEmailScreen();
                }
              }

              /// if the user is verify
              return const Text(('Done'));
            default:
              return const CircularProgressIndicator();

            /// if the user is null
          }
        },
      ),
    );
  }
}
