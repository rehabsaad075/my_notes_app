
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
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
  addNote() async {
    emit(AddNoteLoadingState());
    var noteBo=Hive.box<NoteModel>(noteBox);
    noteModel=NoteModel(
        title: titleController.text,
        content: contentController.text,
        date: formatterDate,
        time: formatterTime,
        color: AppColors.finalColor.value
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
        color: AppColors.finalColor.value
    );
    var noteBo=Hive.box<NoteModel>(noteBox);
    await noteBo.putAt(currentNoteIndex, noteEdit!).then((value) {
      emit(EditNoteSuccessState());
    });

  }
}

