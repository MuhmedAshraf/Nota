class NoteState {}

class NoteInitial extends NoteState {}

class NoteLoading extends NoteState {}

class NoteSuccess extends NoteState {

}

class NoteFailure extends NoteState {

  final String errMessage;

  NoteFailure({required this.errMessage});
}
