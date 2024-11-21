import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/data/datasrouces/themes_color.dart';
import 'package:krives_project/core/data/datasrouces/themes_text_styles.dart';

class CardExoWidgetGraphics extends StatelessWidget {

  const CardExoWidgetGraphics({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    int langageChoice = 0;
    return Container(
      width: 180,
      height: 180,
      margin: EdgeInsets.fromLTRB(10, 10, 0, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ThemesColor.themes[0][themeChoice],
          boxShadow: [ThemesColor.boxShadowCustom]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 85,
            height: 85,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Colors.white,
            ),
          ),
          Text("Push up",style: ThemesTextStyles.themes[5][themeChoice],),
          Text("${SourceLangage.titleProgrammLangage[2][langageChoice]}: My cock",style: ThemesTextStyles.themes[0][themeChoice],),
        ],
      ),
    );
  }
}
