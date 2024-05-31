import 'package:flutter/material.dart';
import 'package:intl/intl.dart'  hide TextDirection;
import 'package:my_notes_app/models/note_model.dart';
import 'package:my_notes_app/view/widget_custom/colors_list_view.dart';
import 'package:my_notes_app/view/widget_custom/text_form_field_custom.dart';
import 'package:my_notes_app/view_model/app_colors.dart';
import 'package:my_notes_app/view_model/app_icons.dart';
import 'package:my_notes_app/view_model/cubits/note_cubit.dart';

class EditNotesScreen extends StatefulWidget {
  final NoteModel ?note;
  const EditNotesScreen({super.key,  this.note});

  @override
  State<EditNotesScreen> createState() => _EditNotesScreenState();
}

class _EditNotesScreenState extends State<EditNotesScreen> {
  var currentDateAndTime=DateFormat('MMM dd, yyyy hh:mm a').format(DateTime.now());
  @override
  initState() {
    super.initState();
    NoteCubit.get(context).setDataFromNoteModelToControllers();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: NoteCubit.get(context).formEditKey,
      child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: AppColors.finalColor,
            appBar: AppBar(
              backgroundColor: AppColors.finalColor,
              actions: [
                IconButton(
                    onPressed: (){
                      showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight:Radius.circular(16)
                              )
                          ),
                          context: context,
                          builder: (context)=> const ColorsListView()
                      );
                    },
                    icon: const Icon(
                        AppIcons.colorIcon
                    )
                ),
                IconButton(
                    onPressed: (){
                      if (NoteCubit.get(context).formEditKey.currentState!.validate()){
                        NoteCubit.get(context).editNote();
                        Navigator.pop(context);
                      }else{
                        Navigator.pop(context);
                      }
                    },
                    icon: const Icon(
                        AppIcons.doneIcon
                    )
                ),
              ],
            ),
            body: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16,),
              children: [
                Text(
                  currentDateAndTime,
                  style: const TextStyle(
                      color: AppColors.gray
                  ),
                ),
                 TextFormFieldCustom(
                  controller: NoteCubit.get(context).titleEditController,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 5,),
                 TextFormFieldCustom(
                   controller: NoteCubit.get(context).contentEditController,
                  maxLines: 35,
                   validator: (value){
                     if(value?.isEmpty ?? true){
                       return 'this value must not empty';
                     }else{
                       return null;
                     }
                   },
                ),
              ],
            ),
          ),
        ),
    );
  }
}
