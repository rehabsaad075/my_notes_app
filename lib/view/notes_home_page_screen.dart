import 'package:flutter/material.dart';
import 'package:my_notes_app/view_model/app_icons.dart';

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
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {  },
          child: const Icon(
              AppIcons.addIcon
          ),
        ),
      ),
    );
  }
}
