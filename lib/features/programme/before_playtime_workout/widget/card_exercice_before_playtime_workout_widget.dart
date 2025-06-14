import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/data_class/exercise.dart';
import 'package:krives_project/core/data/datasrouces/data_class/series.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/programme/before_playtime_workout/widget/mini_card_exo_before_playtime_workout.dart';
import 'package:krives_project/features/programme/before_playtime_workout/widget/mini_widget_card_exercice_before_playtime_workout.dart';
import 'package:krives_project/features/programme/services/services_program.dart';

class CardExerciceBeforePlaytimeWorkoutWidget extends StatelessWidget {
  final Series series;
  final List<Exercise> exerciseList;
  const CardExerciceBeforePlaytimeWorkoutWidget({super.key, required this.series,required this.exerciseList});

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

                  MiniCardExoBeforePlaytimeWorkout(
                    width: 70,
                    height: 70,
                    marginRight: 12,
                      muscle: ServicesProgram.getTheRightExercise(exerciseList, series.idExercice).mainMuscle,),
                  MiniWidgetCardExerciceBeforePlaytimeWorkout(exercise: ServicesProgram.getTheRightExercise(exerciseList, series.idExercice)),
                  Spacer(),
                  Text("${SourceLangage.titleProgrammLangage[3][langageChoice]} : ${series.maxKG}kg",style: ThemesTextStyles.themes[3][themeChoice],),
                  SizedBox(width: 20,),
                ],
              ),
              Text("${SourceLangage.titleProgrammLangage[5][langageChoice]} : ${series.numberSeries}",style: ThemesTextStyles.themes[3][themeChoice],),
              Text("${SourceLangage.titleProgrammLangage[6][langageChoice]} : ${series.numberRep}",style: ThemesTextStyles.themes[3][themeChoice],),
              Text("${SourceLangage.titleProgrammLangage[7][langageChoice]} : ${series.typeSeries}",style: ThemesTextStyles.themes[3][themeChoice],),
            ],
          ),
        ),
      ),
    );
  }
}
