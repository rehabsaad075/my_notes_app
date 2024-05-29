import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes_app/view/screens/edit_notes_screen.dart';
import 'package:my_notes_app/view/widget_custom/notes_item_custom.dart';
import 'package:my_notes_app/view_model/cubits/note_cubit.dart';
import 'package:my_notes_app/view_model/navigation_functions.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) {
        NoteCubit noteCubit=NoteCubit.get(context);
        return ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            itemBuilder: (context, index) {
              return NotesItemCustom(
                onTap: () {
                  navigationPushFunction(
                      context: context,
                      screen: const EditNotesScreen()
                  );
                }, note: noteCubit.notesList[index],
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 10,);
            },
            itemCount: noteCubit.notesList.length
        );
      },
    );
  }
}
