import 'package:flutter/material.dart';
import 'note_item.dart';

class ListNotesBody extends StatelessWidget {
  const ListNotesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, i) => const NoteItem(),
      itemCount: 10,
      physics: const BouncingScrollPhysics(),
    );
  }
}
