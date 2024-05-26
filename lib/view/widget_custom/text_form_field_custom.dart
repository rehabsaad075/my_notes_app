import 'package:flutter/material.dart';
import 'package:my_notes_app/view_model/app_colors.dart';

class TextFormFieldCustom extends StatelessWidget {
  final String hintText;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextEditingController? controller;
  const TextFormFieldCustom({
    super.key,
    required this.hintText,
    this.fontWeight,
    this.maxLines=1,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.appColor,
      maxLines:maxLines ,
      controller:controller ,
      validator: (value){
        if(value?.isEmpty ?? true){
          return 'this value must not empty';
        }else{
          return null;
        }
      },
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
