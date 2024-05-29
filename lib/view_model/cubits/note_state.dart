part of 'note_cubit.dart';

abstract class NoteState {}

class NoteInitial extends NoteState {}

class AddNoteLoadingState extends NoteState {}
class AddNoteSuccessState extends NoteState {}
class AddNoteErrorState extends NoteState {
  final String error;

  AddNoteErrorState(this.error);
}

class GetNotesSuccessState extends NoteState {}

