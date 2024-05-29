import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_notes_app/models/note_model.dart';
import 'package:my_notes_app/view/screens/my_notes_splash_screen.dart';
import 'package:my_notes_app/view_model/app_colors.dart';
import 'package:my_notes_app/view_model/constants.dart';
import 'package:my_notes_app/view_model/cubits/bloc_observer/bloc_observer.dart';
import 'package:my_notes_app/view_model/cubits/note_cubit.dart';

Future<void> main() async {
  Bloc.observer = MyBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(noteBox);
  runApp(const MyNotesApp());
}

class MyNotesApp extends StatelessWidget {
  const MyNotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubit()..getNotes(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const MyNotesSplashScreen(),
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
      ),
    );
  }
}
