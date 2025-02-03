import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';

class MiniTitlePopUpFilter extends StatelessWidget {
  const MiniTitlePopUpFilter({super.key});

  @override
  Widget build(BuildContext context) {
    int langageChoice = 0;
    int themeChoice = 0;
    return Row(
      children: [
        SizedBox(width: 10,),
        Text(
          SourceLangage.titlePopUpFilterLangage[1][langageChoice],
          style: ThemesTextStyles.themes[3][themeChoice],
        ),
      ],
    );
  }
}
