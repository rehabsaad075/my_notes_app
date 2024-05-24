import 'package:flutter/material.dart';
import 'package:my_notes_app/view/screens/add_notes_screen.dart';
import 'package:my_notes_app/view/widget_custom/body_custom/notes_grid_view.dart';
import 'package:my_notes_app/view/widget_custom/body_custom/notes_list_view.dart';
import 'package:my_notes_app/view_model/app_icons.dart';
import 'package:my_notes_app/view_model/navigation_functions.dart';

class NotesHomePageScreen extends StatelessWidget {
  const NotesHomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
              'المفكرة',
          ),
          actions: [
            IconButton(
                onPressed: (){},
                icon: const Icon(
                    AppIcons.squarerIcon
                )
            ),
            IconButton(
                onPressed: (){},
                icon: const Icon(
                    AppIcons.threeDotVertIcon
                )
            ),
          ],
        ),
        body: const NotesGridView(),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            navigationPushFunction(
                context: context,
                screen: const AddNotesScreen()
            );
          },
          child: const Icon(
              AppIcons.addIcon
          ),
        ),
      ),
    );
  }
}
