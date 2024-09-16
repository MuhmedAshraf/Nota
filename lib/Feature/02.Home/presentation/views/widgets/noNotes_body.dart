import 'package:flutter/material.dart';
import '../../../../../Core/utils/assets.dart';

class NoNotesBody extends StatelessWidget {
  const NoNotesBody({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: Image.asset(
        AppImages.addNote,
        width: size.width * 0.8,
        height: size.height * 0.4,
        fit: BoxFit.cover,
      ),
    );
  }
}
