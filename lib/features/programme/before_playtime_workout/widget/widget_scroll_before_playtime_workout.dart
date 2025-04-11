import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/data_class/program.dart';
import 'package:krives_project/features/programme/before_playtime_workout/widget/card_exercice_before_playtime_workout_widget.dart';

class WidgetScrollBeforePlaytimeWorkout extends StatelessWidget {
  final Program program;
  const WidgetScrollBeforePlaytimeWorkout({super.key,required this.program});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
          itemCount: 8,
          itemBuilder: (context, index) => CardExerciceBeforePlaytimeWorkoutWidget(),
        )
    );
  }
}
