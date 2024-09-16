import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repo/note_repo.dart';
import 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  final NoteRepo repo;

  NoteCubit({required this.repo}) : super(NoteInitial());

  Future<void> getNotes() async {
    emit(NoteLoading());
    final response = await repo.getNotes();
    response.fold(
      (errMessage) => emit(NoteFailure(errMessage: errMessage)),
      (notes) => emit(NoteSuccess(notes: notes)),
    );
  }
}
