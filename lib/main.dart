import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_notes_app/view/screens/my_notes_splash_screen.dart';
import 'package:my_notes_app/view_model/app_colors.dart';
import 'package:my_notes_app/view_model/constants.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox(noteBox);
  runApp(const MyNotesApp());
}

class MyNotesApp extends StatelessWidget {
  const MyNotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyNotesSplashScreen() ,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.whiteColor,
          titleTextStyle: TextStyle(
            color: AppColors.appColor,
            fontSize: 22,
            fontWeight: FontWeight.w600
          ),
            titleSpacing: 12,
          iconTheme: IconThemeData(
            color: AppColors.appColor,
            size: 27,
          ),
          actionsIconTheme: IconThemeData(
            color: AppColors.appColor,
            size: 25
          ),
          elevation: 0
        ),
        scaffoldBackgroundColor: AppColors.whiteColor,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
            ),
          backgroundColor: AppColors.appColor
        )
      ),
    );
  }
}
