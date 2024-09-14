import 'package:flutter/material.dart';

void main() {
  runApp(const Notaa());
}

class Notaa extends StatelessWidget {
  const Notaa({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeView(),
    );
  }
}
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text(('hello')),),
    );
  }
}
