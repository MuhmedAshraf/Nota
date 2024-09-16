import '../../../data/models/note_model.dart';

class NoteState {}

class NoteInitial extends NoteState {}

class NoteLoading extends NoteState {}

class NoteSuccess extends NoteState {
  final List<NoteModel> notes ;

  NoteSuccess({required this.notes});

}

class NoteFailure extends NoteState {

  final String errMessage;

  NoteFailure({required this.errMessage});
}
