import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/exercice.dart';
import 'package:krives_project/core/data/datasrouces/data_class/exercices.dart';
import 'package:krives_project/features/exercice/create%20exercice/bloc/exercice/exercice_bloc.dart';
import 'package:krives_project/features/exercice/exercice_main/widget/card_custom_add_exo.dart';
import 'package:krives_project/features/exercice/exercice_main/widget/card_custom_exercise.dart';

class ExercicePage extends StatelessWidget {
  const ExercicePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Exercice> exercises;
    Exercises exercicesService = Exercises();
    final exercicesDoc = exercicesService.getDocExercices();
    final idUser = FirebaseAuth.instance.currentUser!.uid;


    return BlocBuilder<ExerciceBloc, ExerciceState>(
      builder: (context, state) {
        return StreamBuilder(
          stream: exercicesDoc.where('id_user',isEqualTo: idUser).snapshots(),
          builder: (context, snapshot) {

            if(snapshot.hasError){
              return const Center(child: Text("Error"),);
            }
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator(),);
            }

            final exercicesMap = snapshot.data!.docs.map((doc) => doc.data()).toList();
            exercises = Exercises.fromMap(exercicesMap);

            return Container(
              width: 380,
              constraints: BoxConstraints(maxWidth: 500),
              margin: EdgeInsets.fromLTRB(0, 31, 25, 0),
              child: ListView.builder(
                itemCount: exercises.length + 1,
                itemBuilder: (context, index) {
                  if (index == exercises.length) {
                    return Column(
                      children: [
                        CardCustomAddExo(),
                        SizedBox(height: 14),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        CardCustomExercise(
                          exercice: exercises[index].copyWith(),
                          index: index,
                        ),
                        SizedBox(height: 14,),
                      ],
                    );
                  }
                },
              ),
            );
          }
        );
      },
    );
  }
}
