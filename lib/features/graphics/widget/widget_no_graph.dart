import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/theme.dart';
import 'package:krives_project/core/theme/themes_color.dart';

class WidgetNoGraph extends StatelessWidget {
  const WidgetNoGraph({super.key});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    int langageChoice = 0;
    return Container(
      margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      height: 340,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: ThemesColor.themesGradient[2][themeChoice],
      ),
      child: Center(
        child: Text(
          SourceLangage.baseLangage[30][langageChoice],
          style: ThemeCustom.textThemes[10][themeChoice],
        ),
      ),
    );
  }
}
