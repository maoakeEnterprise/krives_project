import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';

class TitlePopUpFilter extends StatelessWidget {
  const TitlePopUpFilter({super.key});

  @override
  Widget build(BuildContext context) {
    int langageChoice = 0;
    int themeChoice = 0;
    return Row(
      children: [
        Text(SourceLangage.titlePopUpFilterLangage[0][langageChoice],style: ThemesTextStyles.themes[5][themeChoice],),
      ],
    );
  }
}
