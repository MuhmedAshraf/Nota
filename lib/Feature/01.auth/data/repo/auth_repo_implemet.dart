import 'package:dartz/dartz.dart';
import 'package:notaa/Core/api_helper/api_consumer.dart';
import 'package:notaa/Core/api_helper/end_points.dart';
import 'package:notaa/Core/errors/exceptions.dart';
import 'package:notaa/Feature/01.auth/data/repo/auth_repo.dart';

class AuthRepoImplement extends AuthRepo {
  final ApiConsumer api;

  AuthRepoImplement({required this.api});

  @override
  Future<Either<String, String>> signInUser({
    required String email,
    required String password,
  }) async {
    try {
      final response = await api.post(
        EndPoints.login,
        data: {
          'email': email,
          'password': password,
        },
      );
      return const Right('Success');
    } on ServerException catch (e) {
      return left(e.errorModel.message);
    }
  }

  @override
  Future<Either<String, String>> signUpUser({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final response = await api.post(
        EndPoints.register,
        data: {'email': email, 'password': password, 'name': name},
      );
      return const Right('Success');
    } on ServerException catch (e) {
      return left(e.errorModel.message);
    }
  }
}
