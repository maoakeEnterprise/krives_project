import 'package:flutter/material.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';

class ButtonWidgetFilters extends StatelessWidget {
  const ButtonWidgetFilters({super.key});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: IconButton(
        onPressed: (){},
        icon: Icon(Icons.more_vert),
        color: ThemesColor.themes[7][themeChoice],
      ),
    );
  }
}
