import 'package:flutter/material.dart';

import '../../../../../Core/utils/colors.dart';
import '../../../../../Core/utils/styles.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.noteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
        child: const Center(
          child: Text(
            'Book Review : The Design of Everyday Things by Don Norman',
            style: AppStyles.noteTitle,
          ),
        ),
      ),
    );
  }
}
