import 'package:flutter/material.dart';
import 'package:my_notes_app/models/note_model.dart';
import 'package:my_notes_app/view_model/app_colors.dart';
import 'package:my_notes_app/view_model/app_icons.dart';
import 'package:my_notes_app/view_model/cubits/note_cubit.dart';

class NotesItemCustom extends StatelessWidget {
  final int? maxLines;
  final void Function()? onTap;
  final NoteModel note;
  const NotesItemCustom({
    super.key,
    this.maxLines=1,
    required this.onTap,
    required this.note
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            color: AppColors.finalColor,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          border:  Border(
            right: BorderSide(
              color: AppColors.finalBorderColor,
              width: 7
            ),
            left: BorderSide(
                color: AppColors.finalBorderColor,
                width: 0
            ),
            top: BorderSide(
                color: AppColors.finalBorderColor,
                width: 0
            ),
            bottom: BorderSide(
                color: AppColors.finalBorderColor,
                width: 0
            ),
          )
        ),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
                note.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),
             Text(
               note.content,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
              ),
              maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: [
                 Expanded(
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(
                        note.date,
                        style: TextStyle(
                            color: AppColors.gray800!
                        ),
                ),
                       const SizedBox(height: 3,),
                       Text(
                        note.time,
                         style: TextStyle(
                             color: AppColors.gray800!
                         ),
                       ),
                     ],
                   ),
                 ),
                IconButton(
                    onPressed: (){
                      note.delete();
                      NoteCubit.get(context).getNotes();
                    },
                    icon:  Icon(
                        AppIcons.deleteIcon,
                      color: AppColors.gray700,
                    )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
