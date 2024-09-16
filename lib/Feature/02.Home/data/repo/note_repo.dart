import 'package:dartz/dartz.dart';
import 'package:notaa/Feature/02.Home/data/models/note_model.dart';

abstract class NoteRepo{
  Future<Either<String,List<NoteModel>>> getNotes();
}