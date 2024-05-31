import 'package:flutter/material.dart';
import 'package:my_notes_app/models/colors_model.dart';
import 'package:my_notes_app/view_model/app_icons.dart';

class ColorItemCustom extends StatelessWidget {
  final bool isSelected;
  final void Function()? onTap;
  final ColorsModel colorsModel;
  const ColorItemCustom({
    super.key,
    required this.isSelected,
    this.onTap,
     required this.colorsModel
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: colorsModel.backColor
        ),
        child:  Row(
          children: [
             CircleAvatar(
              radius: 15,
              backgroundColor: colorsModel.circleColor,
            ),
            const SizedBox(width: 10,),
             Text(
                colorsModel.colorName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500
              ),
            ),
            const Spacer(),
            if(isSelected==true)
              const Icon(
                  AppIcons.doneIcon
              )
          ],
        ),
      ),
    );
  }
}
