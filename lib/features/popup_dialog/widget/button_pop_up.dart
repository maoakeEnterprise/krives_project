import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/data_class/exercise.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/exercice/services/exercise_action_services.dart';

class ButtonPopUp extends StatelessWidget {
  final bool isConfirmButton;
  final String text;
  final Exercise exercise;
  const ButtonPopUp({
    super.key,
    required this.text,
    this.isConfirmButton = false,
    required this.exercise,
  });

  @override
  Widget build(BuildContext context) {
    int chooseThemes = 0;
    Color color = isConfirmButton ? ThemesColor.themes[5][chooseThemes] : ThemesColor.themes[1][chooseThemes];
    return GestureDetector(
      onTap: ExerciseActionServices.isConfirmDeleteOrCancelButtonExercise(context, exercise, isConfirmButton),
      child: Container(
        width: 150,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),
        child: Center(
          child: Text(text,style: ThemesTextStyles.themes[8][chooseThemes],),
        ),
      ),
    );
  }
}


