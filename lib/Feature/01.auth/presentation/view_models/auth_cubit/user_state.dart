
class UserState {}

class UserInitial extends UserState {}

class SignInLoading extends UserState {}

class SignInSuccess extends UserState {
  final String message;

  SignInSuccess({required this.message});
}

class SignInFailure extends UserState {
  final String errMessage;

  SignInFailure({required this.errMessage});
}
//-**-***-*-*--*-*-*-*-*-*-*-**--*-*-*-*---*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*--*-*-*-*--*-*-*

class SignUpLoading extends UserState {}

class SignUpSuccess extends UserState {
  final String message;

  SignUpSuccess({required this.message});
}

class SignUpFailure extends UserState {
  final String errMessage;

  SignUpFailure({required this.errMessage});
}








