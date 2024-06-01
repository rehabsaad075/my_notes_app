
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:my_notes_app/models/colors_model.dart';
import 'package:my_notes_app/models/note_model.dart';
import 'package:my_notes_app/view_model/app_colors.dart';
import 'package:my_notes_app/view_model/constants.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());
  static NoteCubit get(context)=>BlocProvider.of(context);

  var titleController = TextEditingController();
  var contentController = TextEditingController();

  var titleEditController = TextEditingController();
  var contentEditController = TextEditingController();

  var formKey=GlobalKey<FormState>();
  var formEditKey=GlobalKey<FormState>();


  var formatterDate=DateFormat.yMMMd().format(DateTime.now());
  var formatterTime=DateFormat('kk:mm a').format(DateTime.now());

  NoteModel ?noteModel;
  ColorsModel ?colorsModel;
  addNote() async {
    emit(AddNoteLoadingState());
    var noteBo=Hive.box<NoteModel>(noteBox);
    noteModel=NoteModel(
        title: titleController.text,
        content: contentController.text,
        date: formatterDate,
        time: formatterTime,
        color: colorsModel?.backColor.value??AppColors.allColor.value,
        borderColor: colorsModel?.circleColor.value??AppColors.allBorderColor.value ,
        colorName: colorsModel?.colorName??'all'
    );
    await noteBo.add(noteModel!)
        .then((value) {
          getNotes();
          titleController.clear();
          contentController.clear();
      emit(AddNoteSuccessState());
    }).catchError((error){
      emit(AddNoteErrorState(error.toString()));
    });
  }

  List<NoteModel>notesList=[];
  getNotes()async{
    var noteBo=Hive.box<NoteModel>(noteBox);
    notesList= noteBo.values.toList();
    emit(GetNotesSuccessState());
  }

  int currentNoteIndex=0;
  void changeNoteIndex(int index){
    currentNoteIndex=index;
    emit(ChangeNoteIndexState());
  }
  setDataFromNoteModelToControllers(){
    titleEditController.text=notesList[currentNoteIndex].title??'';
    contentEditController.text=notesList[currentNoteIndex].content;
  }
  NoteModel ?noteEdit;
  editNote() async {
    notesList[currentNoteIndex].title=titleEditController.text;
    notesList[currentNoteIndex].content=contentEditController.text;
    notesList[currentNoteIndex].date=formatterDate;
    notesList[currentNoteIndex].time=formatterTime;
    noteEdit=NoteModel(
        title: titleEditController.text,
        content: contentEditController.text,
        date: formatterDate,
        time: formatterTime,
        color: AppColors.finalColor.value,
        borderColor: colorsModel?.circleColor.value??AppColors.allBorderColor.value ,
        colorName: colorsModel?.colorName??'all'
    );
    var noteBo=Hive.box<NoteModel>(noteBox);
    await noteBo.putAt(currentNoteIndex, noteEdit!).then((value) {
      emit(EditNoteSuccessState());
    });

  }


  List<ColorsModel>colorsList=[
    ColorsModel(
      backColor: AppColors.allColor,
      circleColor: AppColors.allBorderColor,
      colorName:'all',
    ),
    ColorsModel(
      backColor: AppColors.personalColor,
      circleColor: AppColors.personalBorderColor,
      colorName:'personal',
    ),
    ColorsModel(
      backColor: AppColors.workColor,
      circleColor: AppColors.workBorderColor,
      colorName:'work',
    ),
    ColorsModel(
      backColor: AppColors.finalColor,
      circleColor: AppColors.finalBorderColor,
      colorName:'final',
    ),
    ColorsModel(
        backColor: AppColors.othersColor,
        circleColor: AppColors.othersBorderColor,
        colorName:'other'
    ),
  ];



  int currentIndex=0;
  void changeIndexOfColors(int index){
    currentIndex=index;
    emit(ChangeIndexOfColorsState());
  }


  Color scaffoldColor=AppColors.allColor;
  void addColorToNote(int index){
    colorsModel=colorsList[index];
    scaffoldColor=colorsModel?.backColor??AppColors.allColor;
    emit(AddColorToNoteState());
  }
}

