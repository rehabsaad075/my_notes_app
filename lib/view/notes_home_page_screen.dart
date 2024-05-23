import 'package:flutter/material.dart';
import 'package:my_notes_app/view/add_notes_screen.dart';
import 'package:my_notes_app/view/widget_custom/notes_item_custom.dart';
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
        body: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
            itemBuilder: (context,index){
              return const NotesItemCustom();
            },
            separatorBuilder: (context,index){
              return const SizedBox(height: 10,);
            },
            itemCount: 10
        ),
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
