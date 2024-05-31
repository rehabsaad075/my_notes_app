import 'package:flutter/material.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:my_notes_app/view/widget_custom/colors_list_view.dart';
import 'package:my_notes_app/view/widget_custom/text_form_field_custom.dart';
import 'package:my_notes_app/view_model/app_colors.dart';
import 'package:my_notes_app/view_model/app_icons.dart';
import 'package:my_notes_app/view_model/cubits/note_cubit.dart';

class AddNotesScreen extends StatelessWidget {
  const AddNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: NoteCubit.get(context).formKey,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: AppColors.allColor,
          appBar: AppBar(
            backgroundColor: AppColors.allColor,
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
                    if (NoteCubit.get(context).formKey.currentState!.validate()){
                      NoteCubit.get(context).addNote();
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
                 DateFormat('MMM dd, yyyy hh:mm a').format(DateTime.now()),
                style: const TextStyle(
                  color: AppColors.gray
                ),
              ),
              TextFormFieldCustom(
                hintText: 'عنوان',
                fontWeight: FontWeight.w600,
                controller: NoteCubit.get(context).titleController,
              ),
              const SizedBox(height: 5,),
              TextFormFieldCustom(
                hintText: 'اكتب ملاحظاتك',
                maxLines: 35,
                validator: (value){
                  if(value?.isEmpty ?? true){
                    return 'this value must not empty';
                  }else{
                    return null;
                  }
                },
                controller: NoteCubit.get(context).contentController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
