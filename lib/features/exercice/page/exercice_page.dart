import 'package:flutter/material.dart';
import 'package:krives_project/features/exercice/widget/card_custom_add_exercise.dart';
import 'package:krives_project/features/exercice/widget/card_custom_exercise.dart';

class ExercicePage extends StatelessWidget {
  const ExercicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      constraints: BoxConstraints(maxWidth: 500),
      margin: EdgeInsets.fromLTRB(0, 31, 25, 0),
      child: ListView(
        children: [
          CardCustomExercise(),
          SizedBox(height: 29,),
          CardCustomAddExercise()
        ],
      ),
    );
  }
}
