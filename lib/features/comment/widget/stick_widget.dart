import 'package:flutter/material.dart';
import 'package:krives_project/core/theme/themes_color.dart';

class StickWidget extends StatelessWidget {
  const StickWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    return Container(
      height: 5,
      width: 43,
      decoration: BoxDecoration(
        color: ThemesColor.themes[7][themeChoice],
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
