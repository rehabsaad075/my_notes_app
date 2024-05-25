
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());
  static NoteCubit get(context)=>BlocProvider.of(context);

  var titleController = TextEditingController();
  var contentController = TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();

  var formKey=GlobalKey<FormState>();
}
