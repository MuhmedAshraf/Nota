import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notaa/Feature/01.auth/data/repo/auth_repo_implemet.dart';
import 'package:notaa/Feature/01.auth/presentation/view_models/auth_cubit/user_state.dart';

class UserCubit extends Cubit<UserState> {
  final AuthRepoImplement userRepo;

  UserCubit({required this.userRepo}) : super(UserInitial());

  //Sign in Form key
  GlobalKey<FormState> signInFormKey = GlobalKey();

  //Sign in email
  TextEditingController signInEmail = TextEditingController();

  //Sign in password
  TextEditingController signInPassword = TextEditingController();

  //Sign Up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();

  //Sign up name
  TextEditingController signUpName = TextEditingController();

  //Sign up email
  TextEditingController signUpEmail = TextEditingController();

  //Sign up password
  TextEditingController signUpPassword = TextEditingController();


  signIn() async {
    emit(SignInLoading());
    final response = await userRepo.signInUser(
        email: signInEmail.text, password: signInPassword.text);
    response.fold(
      (errMessage) => emit(SignInFailure(errMessage: errMessage)),
      (message) => emit(SignInSuccess(message: message)),
    );
  }

  signUp() async {
    emit(SignUpLoading());
    final response = await userRepo.signUpUser(
      email: signUpEmail.text,
      password: signUpPassword.text,
      name: signUpName.text,
    );
    response.fold(
      (errMessage) => emit(SignInFailure(errMessage: errMessage)),
      (message) => emit(SignInSuccess(message: message)),
    );
  }
}
