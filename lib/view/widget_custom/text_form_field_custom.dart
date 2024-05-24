import 'package:flutter/material.dart';
import 'package:my_notes_app/view_model/app_colors.dart';

class TextFormFieldCustom extends StatelessWidget {
  final String hintText;
  final FontWeight? fontWeight;
  final int? maxLines;
  const TextFormFieldCustom({
    super.key,
    required this.hintText,
    this.fontWeight,
    this.maxLines=1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.appColor,
      maxLines:maxLines ,
      style: const TextStyle(
        fontSize: 18
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 18,
          fontWeight: fontWeight
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.gray
          )
        )
      ),
    );
  }
}
