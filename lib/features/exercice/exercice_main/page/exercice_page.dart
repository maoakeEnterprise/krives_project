import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/exercice.dart';
import 'package:krives_project/core/data/datasrouces/data_class/exercices.dart';
import 'package:krives_project/core/data/datasrouces/muscle_data.dart';
import 'package:krives_project/features/exercice/create%20exercice/bloc/exercice/exercice_bloc.dart';
import 'package:krives_project/features/exercice/exercice_main/widget/card_custom_add_exo.dart';
import 'package:krives_project/features/exercice/exercice_main/widget/card_custom_exercise.dart';

class ExercicePage extends StatelessWidget {
  const ExercicePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Exercice> listExercice = [
      Exercice("Push up", muscleData[0], [muscleData[1], muscleData[2]], "en faite pas trop"),
      Exercice("Push up", muscleData[0], [muscleData[1], muscleData[2]], "en faite pas trop"),
    ];
    Exercises exercises = Exercises(listExercice);

    return BlocBuilder<ExerciceBloc, ExerciceState>(
      builder: (context, state) {
        return Container(
          width: 380,
          constraints: BoxConstraints(maxWidth: 500),
          margin: EdgeInsets.fromLTRB(0, 31, 25, 0),
          child: ListView.builder(
            itemCount: exercises.listExercise.length + 1,
            itemBuilder: (context, index) {
              if (index == exercises.listExercise.length) {
                return Column(
                  children: [
                    CardCustomAddExo(
                      exercises: exercises,
                    ),
                    SizedBox(height: 14),
                  ],
                );
              } else {
                return Column(
                  children: [
                    CardCustomExercise(
                      exercice: exercises.listExercise[index].copyWith(),
                      exercices: exercises,
                      index: index,
                    ),
                    SizedBox(height: 14,),
                  ],
                );
              }
            },
          ),
        );
      },
    );
  }
}
