import 'package:flutter/material.dart';

import '../../../../../Core/utils/colors.dart';
import '../../../../../Core/utils/styles.dart';
import '../../../data/models/note_model.dart';

class NoteItem extends StatelessWidget {
  final NoteModel note ;
  const NoteItem({super.key, required this.note});

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
