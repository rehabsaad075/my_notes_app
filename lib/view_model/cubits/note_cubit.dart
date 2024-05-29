
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

  var formKey=GlobalKey<FormState>();

  NoteModel ?noteModel;
  addNote() async {
    emit(AddNoteLoadingState());
    var noteBo=Hive.box<NoteModel>(noteBox);
    noteModel=NoteModel(
        title: titleController.text,
        content: contentController.text,
        date: DateFormat.yMMMd().format(DateTime.now()),
        time: DateFormat('kk:mm').format(DateTime.now()),
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
}

