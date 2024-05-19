import 'package:flutter/material.dart';
import 'package:my_notes_app/view/my_notes_splash_screen.dart';

void main() {
  runApp(const MyNotesApp());
}

class MyNotesApp extends StatelessWidget {
  const MyNotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyNotesSplashScreen() ,
    );
  }
}
