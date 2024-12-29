import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/themes_color.dart';
import 'package:krives_project/core/data/datasrouces/themes_text_styles.dart';

class ButtonTimeWidgetGraphics extends StatelessWidget {
  final String text;
  const ButtonTimeWidgetGraphics({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    return Container(
      width: 80,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: ThemesColor.themes[0][themeChoice],
      ),
      child: Center(
        child: Text(text,style: ThemesTextStyles.themes[3][themeChoice],),
      ),
    );
  }
}
