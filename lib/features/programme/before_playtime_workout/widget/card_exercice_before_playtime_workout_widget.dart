import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/programme/before_playtime_workout/widget/mini_card_exo_before_playtime_workout.dart';
import 'package:krives_project/features/programme/before_playtime_workout/widget/mini_widget_card_exercice_before_playtime_workout.dart';

class CardExerciceBeforePlaytimeWorkoutWidget extends StatelessWidget {
  const CardExerciceBeforePlaytimeWorkoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    int langageChoice = 0;
    return Container(
      margin: EdgeInsets.fromLTRB(25, 0, 25, 22),
      width: 380,
      height: 190,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ThemesColor.themes[0][themeChoice],
        boxShadow: [ThemesColor.boxShadowCustom],

      ),
      child: Container(
        width: 380,
        height: 190,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: ThemesColor.themesGradient[1][themeChoice],
          color: ThemesColor.themes[0][themeChoice].withValues(alpha: 0.3),
        ),
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 20, 0, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MiniCardExoBeforePlaytimeWorkout(width: 70, height: 70,marginRight: 12,),
                  MiniWidgetCardExerciceBeforePlaytimeWorkout(),
                  Spacer(),
                  Text("${SourceLangage.titleProgrammLangage[3][langageChoice]} : 15kg",style: ThemesTextStyles.themes[3][themeChoice],),
                  SizedBox(width: 20,),
                ],
              ),
              Text("${SourceLangage.titleProgrammLangage[5][langageChoice]} : 4",style: ThemesTextStyles.themes[3][themeChoice],),
              Text("${SourceLangage.titleProgrammLangage[6][langageChoice]} : 13",style: ThemesTextStyles.themes[3][themeChoice],),
              Text("${SourceLangage.titleProgrammLangage[7][langageChoice]} : Normal",style: ThemesTextStyles.themes[3][themeChoice],),
            ],
          ),
        ),
      ),
    );
  }
}
