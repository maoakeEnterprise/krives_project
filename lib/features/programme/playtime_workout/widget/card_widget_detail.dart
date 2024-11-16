import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/themes_color.dart';
import 'package:krives_project/core/data/datasrouces/themes_text_styles.dart';

class CardWidgetDetail extends StatelessWidget {
  final String labelText;
  const CardWidgetDetail({
    super.key,
    this.labelText = "",
  });

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    return Container(
      width: 120,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: ThemesColor.themes[0][themeChoice],
      ),
      child: Center(child: Text(labelText,style: ThemesTextStyles.themes[6][themeChoice],)),
    );
  }
}
