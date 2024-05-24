import 'package:flutter/material.dart';
import 'package:my_notes_app/view_model/app_colors.dart';
import 'package:my_notes_app/view_model/app_icons.dart';

class NotesItemCustom extends StatelessWidget {
  final int? maxLines;
  const NotesItemCustom({super.key, this.maxLines=1});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: AppColors.othersColor,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        border:  Border(
          right: BorderSide(
            color: AppColors.othersBorderColor,
            width: 7
          ),
          left: BorderSide(
              color: AppColors.othersBorderColor,
              width: 0
          ),
          top: BorderSide(
              color: AppColors.othersBorderColor,
              width: 0
          ),
          bottom: BorderSide(
              color: AppColors.othersBorderColor,
              width: 0
          ),
        )
      ),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
              'تجربة',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),
           Text(
            'تنزيل هذا التطبيق وتجربته لانشاء تطبيقى الخاص بى,الان اقوم بكتابة الكود الخاص بهذا التطبيق',
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
                      'May 20,2024',
                      style: TextStyle(
                          color: AppColors.gray!
                      ),
              ),
                     const SizedBox(height: 3,),
                     Text(
                       '2:50 AM',
                       style: TextStyle(
                           color: AppColors.gray!
                       ),
                     ),
                   ],
                 ),
               ),
              IconButton(
                  onPressed: (){},
                  icon: const Icon(
                      AppIcons.threeDotVertIcon
                  )
              ),
            ],
          ),
        ],
      ),
    );
  }
}
