import 'package:flutter/material.dart';
import 'package:notaa/Feature/01.auth/presentation/views/login_view.dart';
import 'package:notaa/Feature/02.Home/presentation/views/home_view.dart';

void main() {
  runApp(const Notaa());
}

class Notaa extends StatelessWidget {
  const Notaa({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
