import 'package:flutter/material.dart';
import 'package:krives_project/core/data/repositories/widget_scroll.dart';
import 'package:krives_project/features/programme/before_playtime_workout/widget/card_exercice_before_playtime_workout_widget.dart';

class WidgetScrollBeforePlaytimeWorkout extends StatelessWidget {
  const WidgetScrollBeforePlaytimeWorkout({super.key});

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
