import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/muscle_data.dart';
import 'package:krives_project/features/exercice/create%20exercice/widget/card_secondary_muscle.dart';

class WidgetScrollSecondaryMuscle extends StatelessWidget {
  const WidgetScrollSecondaryMuscle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 143,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: muscleData.length,
          padding: EdgeInsets.fromLTRB(0, 18, 0, 25),
          itemBuilder: (context, index){
            return CardSecondaryMuscle(index: index,muscle: muscleData[index],);
          }),
    );
  }
}
