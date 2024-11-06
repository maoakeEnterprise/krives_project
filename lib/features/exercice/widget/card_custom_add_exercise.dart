import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/colors_custom.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/data/datasrouces/text_styles_custom.dart';

class CardCustomAddExercise extends StatelessWidget {
  const CardCustomAddExercise({super.key});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    int langageChoice = 0;
    return Container(
      height: 110,
      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ThemesColor.themes[0][themeChoice],
        boxShadow: [BoxShadow(
            offset: Offset(1,3),
            blurRadius: 5,
            color: Colors.black.withOpacity(0.7)
        )]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(SourceLangage.baseLangage[15][langageChoice],style: ThemesTextStyles.themes[5][themeChoice],),
          SizedBox(width: 14,),
          Icon(Icons.add,color: ThemesColor.themes[7][themeChoice],)
        ],
      ),
    );
  }
}
