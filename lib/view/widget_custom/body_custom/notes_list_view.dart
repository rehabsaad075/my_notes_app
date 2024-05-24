import 'package:flutter/material.dart';
import 'package:my_notes_app/view/widget_custom/notes_item_custom.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
        itemBuilder: (context,index){
          return const NotesItemCustom();
        },
        separatorBuilder: (context,index){
          return const SizedBox(height: 10,);
        },
        itemCount: 10
    );
  }
}
