import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/data/datasrouces/themes_color.dart';
import 'package:krives_project/core/data/datasrouces/themes_text_styles.dart';
import 'package:krives_project/core/data/repositories/card_custom_color1.dart';

class WidgetCardSeries extends StatelessWidget {
  const WidgetCardSeries({super.key});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    int langageChoice = 0;
    return CardCustomColor1(
      left: 41,
      right: 41,
      top: 36,
      width: 0,
      height: 110,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25,),
              Text("My Exo name",style: ThemesTextStyles.themes[5][themeChoice],),
              Text("${SourceLangage.titleProgrammLangage[0][langageChoice]}: 20",style: ThemesTextStyles.themes[0][themeChoice],),
              Text("${SourceLangage.titleProgrammLangage[1][langageChoice]}: 10",style: ThemesTextStyles.themes[0][themeChoice],),
              Text("${SourceLangage.titleProgrammLangage[2][langageChoice]}: My cock",style: ThemesTextStyles.themes[0][themeChoice],),
              Text("${SourceLangage.titleProgrammLangage[3][langageChoice]}: 15kg",style: ThemesTextStyles.themes[0][themeChoice],),
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(60, 20, 0, 0),
            child: Icon(Icons.settings,color: ThemesColor.themes[7][themeChoice],),
          ),
        ],
      ),
    );
  }
}
