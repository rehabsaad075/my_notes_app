import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes_app/view/widget_custom/color_item_custom.dart';
import 'package:my_notes_app/view_model/cubits/note_cubit.dart';
class ColorsListView extends StatelessWidget {
  const ColorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteState>(
    builder: (context, state) {
    NoteCubit noteCubit=NoteCubit.get(context);
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
                        noteCubit.changeIndexOfColors(index);
                        noteCubit.addColorToNote(index);
                        Navigator.pop(context);
                      },
                      isSelected: noteCubit.currentIndex==index,
                      colorsModel: noteCubit.colorsList[index],
                    ),
                separatorBuilder: (context,index)=>const SizedBox(height: 20,),
                itemCount: noteCubit.colorsList.length
            ),
          )
        ],
      ),
    );
  },
);
  }
}

