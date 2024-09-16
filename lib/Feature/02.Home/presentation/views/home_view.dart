import 'package:flutter/material.dart';
import 'package:notaa/Core/utils/colors.dart';
import 'package:notaa/Core/utils/styles.dart';
import 'package:notaa/Feature/02.Home/presentation/views/widgets/list_notes_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: const Text(
          'Notes',
          style: AppStyles.title,
        ),
      ),
      body: const SafeArea(child: ListNotesBody()),
      floatingActionButton: FloatingActionButton(
        shape:  const CircleBorder(),
        onPressed: () {},
        backgroundColor: AppColors.mainColor,
        child: const Icon(
          Icons.add,
          size: 35,
          color: Colors.white,
        ),
      ),
    );
  }
}
