import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_notes/Screens/sign_in_screen.dart';
import 'package:my_notes/firebase_options.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<LoginScreen> {
  /// create texteditingcontroller for the email and password.
  late final TextEditingController email;
  late final TextEditingController password;
  @override
  void initState() {
    email = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  /// dispose email and pass
  @override
  void dispose() {
    email.dispose();
    password.dispose();
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(236, 64, 122, 1),
        title: const Text('Loign'),
      ),
      backgroundColor: Colors.white,

      ///  { -- future builer it is perform the future ine the future is suscceed or faild
      /// doing its work it is will ive you a callback
      ///and this call back asks you to preduce the widget ou want to display ti th user
      /// depending of the state of that futures result --}
      body: FutureBuilder(
          future: Firebase.initializeApp(
              options: DefaultFirebaseOptions.currentPlatform),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                return Column(children: [
                  /// email textfield
                  TextField(
                    /// to add @ to the phone keyboard
                    keyboardType: TextInputType.emailAddress,

                    ///prevent suggestions in phone keyboard
                    enableSuggestions: false,

                    ///prevent correction in phone keyboard
                    autocorrect: false,

                    controller: email,
                    decoration: const InputDecoration(
                      hintText: 'Enter your email',
                    ),
                  ),

                  /// pasword textfield
                  TextField(
                    obscureText: true,
                    enableSuggestions: false,

                    ///prevent suggestions in phone keyboard
                    autocorrect: false,

                    ///prevent correction in phone keyboard
                    controller: password,
                    decoration:
                        const InputDecoration(hintText: 'Enter password'),
                  ),

                  /// work of registeration (create user from email and pass after the user press the signin button)
                  TextButton(
                      onPressed: () async {
                        final userEmail = email.text;
                        final userPassowrd = password.text;

                        /// Tries to create a new user account with the given email address and password.
                        /// if you dont put await you will only get the instance of the future not the work that it is doning
                        // ignore: non_constant_identifier_names
                        try {
                          final UserCredential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: userEmail, password: userPassowrd);
                          print(UserCredential);

                          /// write on and then you write the runype or the class name of
                          ///  the Type of exeption that you interesed in handling
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-founf') {
                            //print('user not found');
                          } else {
                            //print('something else hapend');
                            print(e.code);
                          }
                        }
                      },
                      child: const Text('Login')),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/signin', (route) => false);
                      },
                      child:
                          const Text('You dont have account ? regerster her '))
                ]);

              default:
                return const Text('Loading .....');
            }
          }),
    ));
  }
}
//// snapshot is the way to give the result of the future
