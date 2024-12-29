import 'package:flutter/material.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';

class TitleWidgetSeries extends StatelessWidget {
  final String? title;
  final double? top;
  const TitleWidgetSeries({
    super.key,
    this.title="",
    this.top=0
  });

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    return Container(
      margin: EdgeInsets.fromLTRB(8, top!, 0, 0),
      child: Text("$title :",style: ThemesTextStyles.themes[5][themeChoice],),
    );
  }
}
