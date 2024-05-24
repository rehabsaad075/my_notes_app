import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:my_notes_app/view/screens/notes_home_page_screen.dart';

class MyNotesSplashScreen extends StatelessWidget {
  const MyNotesSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 3000,
      splash:  ('assets/images/notes logo.png'),
      nextScreen: const NotesHomePageScreen(),
      splashIconSize: 170,
      splashTransition: SplashTransition.scaleTransition,
      backgroundColor: Colors.white,
    );
  }
}
