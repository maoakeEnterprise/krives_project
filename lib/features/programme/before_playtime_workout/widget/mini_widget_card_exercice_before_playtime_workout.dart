import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/data_class/exercise.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/programme/before_playtime_workout/widget/mini_card_exo_before_playtime_workout.dart';
import 'package:krives_project/features/programme/services/services_program.dart';

class MiniWidgetCardExerciceBeforePlaytimeWorkout extends StatelessWidget {
  final Exercise exercise;
  const MiniWidgetCardExerciceBeforePlaytimeWorkout({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;

    return SizedBox(
      height: 70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          exercise.secondariesMuscles.isNotEmpty ?
          Row(
            children: ServicesProgram.muscleToShow(exercise.secondariesMuscles, 4).map((muscle) { //
              return MiniCardExoBeforePlaytimeWorkout(
                width: 30,
                height: 30,
                marginRight: 12,
                muscle: muscle,
              );
            }).toList(),
          ) : const SizedBox(),

          Text(exercise.name,style: ThemesTextStyles.themes[5][themeChoice],)
        ],
      ),
    );
  }
}
