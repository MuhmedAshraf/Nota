import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<String, String>> signInUser({
    required String email,
    required String password,
  });

  Future<Either<String, String>> signUpUser({
    required String email,
    required String password,
    required String name,
  });
}
