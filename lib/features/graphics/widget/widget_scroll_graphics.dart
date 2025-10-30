import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/data_class/exercise.dart';
import 'package:krives_project/features/graphics/widget/card_exo_widget_graphics.dart';

class WidgetScrollGraphics extends StatelessWidget {

  final List<Exercise> exercises;
  final String exerciseSelected;

  const WidgetScrollGraphics({
    super.key,
    required this.exercises,
    required this.exerciseSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: exercises.length,
          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
          itemBuilder: (context, index){
            return CardExoWidgetGraphics(
              exercise: exercises[index],
              idExerciseSelected: exerciseSelected,
              listExercises: exercises,
            );
          }),
    );
  }
}
