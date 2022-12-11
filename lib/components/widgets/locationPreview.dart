import 'package:flutter/material.dart';

class MyPreview extends StatelessWidget {
  final String image;

  MyPreview({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8, right: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
      ),
      height: 130,
      width: 250,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10), // Image border
        child: SizedBox.fromSize(
          size: Size.fromRadius(10), // Image radius
          child: Image.asset('$image', fit: BoxFit.cover),
        ),
      ),
    );
  }
}
