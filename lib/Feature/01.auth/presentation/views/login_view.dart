import 'package:flutter/material.dart';
import 'package:notaa/Feature/01.auth/presentation/views/widgets/loginViewBody.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginViewBody(),
    );
  }
}
