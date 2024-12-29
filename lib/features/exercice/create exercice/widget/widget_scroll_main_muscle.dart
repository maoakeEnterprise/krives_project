import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/features/exercice/create%20exercice/bloc/main_muscle/main_muscle_bloc.dart';
import 'package:krives_project/features/exercice/create%20exercice/widget/card_main_muscle.dart';

class WidgetScrollMainMuscle extends StatelessWidget {
  const WidgetScrollMainMuscle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 223,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          padding: EdgeInsets.fromLTRB(0, 18, 0, 25),
          itemBuilder: (context, index) {
            return CardMainMuscle(index: index);
          }),
    );
  }
}
