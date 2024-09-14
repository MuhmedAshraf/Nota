import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {

  String image;
  PageHeader({
    super.key,
    required this.image,
  });



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.3,
      child: Image.asset(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}
