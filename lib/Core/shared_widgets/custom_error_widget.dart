import 'package:flutter/material.dart';
import 'package:notaa/Core/utils/styles.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errorText});

  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(errorText,style: AppStyles.noteTitle.copyWith(color: Colors.white),),
    );
  }
}
