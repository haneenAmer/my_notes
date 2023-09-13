import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

enum MenuAction { logout }

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('notes'),
            actions: [
              /// الـ3 نقاط العمودية
              PopupMenuButton<MenuAction>(
                onSelected: (value) async {
                  /// the type of value is enum (logout)
                  //devtools.log(value.toString());
                  switch (value) {
                    case MenuAction.logout:
                      final shouldLogOut = await showLogOutDialog(context);
                      devtools.log(shouldLogOut.toString());
                      break;
                  }

                  /// chan to string
                },
                itemBuilder: (context) {
                  return const [
                    PopupMenuItem<MenuAction>(
                      /// the child is what the user see and the value is
                      /// what the programmer see
                      value: MenuAction.logout,
                      child: Text('logout'),
                    )
                  ];
                },
              )
            ],
          ),
          body: const Column()),
    );
  }
}

Future<bool> showLogOutDialog(BuildContext context) {
  return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('logout'),
          content: const Text('Do you want to log out ?'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text('Cancel')),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text('Logout')),
          ],
        );
      }).then((value) => value ?? false);
}
