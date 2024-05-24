import 'package:flutter/material.dart';
import 'package:my_notes_app/view/widget_custom/notes_item_custom.dart';

class NotesGridView extends StatelessWidget {
  const NotesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.9/1,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15
    ),
        itemBuilder: (context,index){
      return const NotesItemCustom(
        maxLines: 3,
      );
    },
      itemCount: 10,
    );
  }
}
