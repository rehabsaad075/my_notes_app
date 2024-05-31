import 'package:flutter/material.dart';
import 'package:my_notes_app/models/colors_model.dart';
import 'package:my_notes_app/view/widget_custom/color_item_custom.dart';
import 'package:my_notes_app/view_model/app_colors.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex=0;
  List<ColorsModel>colorsList=[
    ColorsModel(
      backColor: AppColors.allColor,
      circleColor: AppColors.allBorderColor,
      colorName:'all',
    ),
    ColorsModel(
        backColor: AppColors.finalColor,
        circleColor: AppColors.finalBorderColor,
        colorName:'final',
    ),
    ColorsModel(
      backColor: AppColors.workColor,
      circleColor: AppColors.workBorderColor,
      colorName:'work',
    ),
    ColorsModel(
      backColor: AppColors.personalColor,
      circleColor: AppColors.personalBorderColor,
      colorName:'personal',
    ),
    ColorsModel(
      backColor: AppColors.othersColor,
      circleColor: AppColors.othersBorderColor,
      colorName:'other'
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text(
              'غير اللون',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600
            ),
          ),
          const SizedBox(height: 5,),
          Expanded(
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context,index)=>
                 ColorItemCustom(
                   onTap: (){
                     currentIndex=index;
                     setState(() {

                     });
                   },
                  isSelected: currentIndex==index,
                   colorsModel: colorsList[index],
                ),
                separatorBuilder: (context,index)=>const SizedBox(height: 20,),
                itemCount: colorsList.length
            ),
          )
        ],
      ),
    );
  }
}
