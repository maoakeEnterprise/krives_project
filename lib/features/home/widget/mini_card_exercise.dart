import 'package:flutter/material.dart';
import 'package:krives_project/core/theme/themes_color.dart';

class MiniCardExercise extends StatelessWidget {
  final Widget? widget;

  const MiniCardExercise({super.key, this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: ThemesColor.blackColor3,
      ),
      child: null,
    );
  }
}
