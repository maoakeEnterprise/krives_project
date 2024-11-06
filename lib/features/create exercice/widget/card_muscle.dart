import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/colors_custom.dart';
import 'package:krives_project/core/data/datasrouces/text_styles_custom.dart';

class CardMuscle extends StatelessWidget {
  final double width;
  final double height;
  final double marginRight;
  final double widthImage;
  final double heightImage;
  final double marginImageTop;
  final double marginImageBottom;

  const CardMuscle({
    super.key,
    required this.width,
    required this.height,
    required this.widthImage,
    required this.heightImage,
    required this.marginImageTop,
    required this.marginImageBottom,
    this.marginRight = 16,
  });

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.fromLTRB(0, 0, marginRight, 0),
      decoration: BoxDecoration(
        color: ThemesColor.themes[0][themeChoice],
        borderRadius: BorderRadius.circular(12),
        boxShadow:[ BoxShadow(
          color: Colors.black,
          offset: Offset(1, 3),
          blurRadius: 5
        )]
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, marginImageTop, 0, marginImageBottom),
            width: widthImage,
            height: heightImage,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7)
            ),
          ),
          Text("Pec", style: ThemesTextStyles.themes[5][themeChoice],)
        ],
      ),
    );
  }
}
