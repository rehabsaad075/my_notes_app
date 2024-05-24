import 'package:flutter/material.dart';
import 'package:my_notes_app/view/widget_custom/text_form_field_custom.dart';
import 'package:my_notes_app/view_model/app_colors.dart';
import 'package:my_notes_app/view_model/app_icons.dart';

class EditNotesScreen extends StatelessWidget {
  const EditNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: (){},
                icon: const Icon(
                    AppIcons.doneIcon
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
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16,),
          children: const [
            Text(
              'may 20,2024 2:50 AM',
              style: TextStyle(
                  color: AppColors.gray
              ),
            ),
            TextFormFieldCustom(
              hintText: 'تجربة',
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 5,),
            TextFormFieldCustom(
              hintText: 'تنزيل هذا التطبيق وتجربته لانشاء تطبيقى الخاص بى,الان اقوم بكتابة الكود الخاص بهذا التطبيق',
              maxLines: 35,
            ),
          ],
        ),
      ),
    );
  }
}
