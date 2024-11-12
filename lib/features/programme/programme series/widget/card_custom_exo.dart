import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/data/datasrouces/themes_color.dart';
import 'package:krives_project/core/data/datasrouces/themes_text_styles.dart';

class CardCustomExo extends StatelessWidget {
  const CardCustomExo({super.key});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    int langageChoice = 0;
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 16, 0),
      width: 180,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ThemesColor.themes[0][themeChoice],
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            offset: Offset(1, 3),
            blurRadius: 5
          )
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 15,),
          Container(
            width: 85,
            height: 85,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7)
            ),
          ),
          SizedBox(height: 12,),
          Text("Nom exercice",style: ThemesTextStyles.themes[5][themeChoice],),
          SizedBox(height: 8,),
          Text("${SourceLangage.titleSeriesPage[5][langageChoice]} : Biceps",style: ThemesTextStyles.themes[0][themeChoice],),
        ],
      ),
    );
  }
}
