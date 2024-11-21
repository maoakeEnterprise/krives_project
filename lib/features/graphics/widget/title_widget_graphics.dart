import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/themes_text_styles.dart';

class TitleWidgetGraphics extends StatelessWidget {
  final String title;
  final double marginLeft;
  final double marginTop;
  final double marginRight;
  final double marginBottom;
  const TitleWidgetGraphics({
    super.key,
    required this.title,
    this.marginLeft = 0,
    this.marginTop = 0,
    this.marginRight = 0,
    this.marginBottom = 0,
  });

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    return Container(
      margin: EdgeInsets.fromLTRB(marginLeft, marginTop, marginRight, marginBottom),
      child: Text(title, style: ThemesTextStyles.themes[5][themeChoice],),
    );
  }
}
