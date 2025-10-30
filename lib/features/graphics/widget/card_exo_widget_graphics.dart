import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/data_class/exercise.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/graphics/services/graphics_action_services.dart';
import 'package:krives_project/features/graphics/services/graphics_services.dart';

class CardExoWidgetGraphics extends StatelessWidget {

  final Exercise exercise;
  final String idExerciseSelected;
  final List<Exercise> listExercises;
  const CardExoWidgetGraphics({
    super.key,
    required this.exercise,
    required this.idExerciseSelected,
    required this.listExercises,
  });

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    int langageChoice = 0;
    return GestureDetector(
      onTap: GraphicsActionServices.selectingThisExercise(exercise.id, listExercises, context),
      child: Container(
        width: 180,
        height: 180,
        margin: EdgeInsets.fromLTRB(10, 10, 0, 10),
        decoration: BoxDecoration(
          border: GraphicsServices.isTheExerciseIsSelected(exercise.id, idExerciseSelected, themeChoice),
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
            Text(exercise.name,style: ThemesTextStyles.themes[5][themeChoice],),
            Text("${SourceLangage.titleProgrammLangage[2][langageChoice]}: ${exercise.mainMuscle.nameMuscle[0]}",
              style: ThemesTextStyles.themes[0][themeChoice],
            ),
          ],
        ),
      ),
    );
  }
}
