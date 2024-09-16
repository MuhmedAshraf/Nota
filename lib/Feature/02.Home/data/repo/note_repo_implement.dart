import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:notaa/Core/api_helper/api_consumer.dart';
import 'package:notaa/Core/api_helper/end_points.dart';
import 'package:notaa/Core/errors/exceptions.dart';
import 'package:notaa/Feature/02.Home/data/models/note_model.dart';
import 'package:notaa/Feature/02.Home/data/repo/note_repo.dart';

class NoteRepoImplement extends NoteRepo {
  final ApiConsumer api;

  NoteRepoImplement({required this.api});

  @override
  Future<Either<String, List<NoteModel>>> getNotes() async {
    try {
      final response = await api.get(
        EndPoints.getNotes,
        queryParameters: {"page": "1"},
      );
      List<NoteModel> notes = [];
      for (var item in response['notes']) {
        notes.add(NoteModel.fromJson(item));
      }
      return Right(notes);
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }
}
