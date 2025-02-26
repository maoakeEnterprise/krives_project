import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/features/exercice/exercice_main/bloc/bloc_exercise_services/exercise_serv_bloc.dart';
import 'package:krives_project/features/exercice/exercice_main/widget/card_custom_add_exo.dart';
import 'package:krives_project/features/exercice/exercice_main/widget/card_custom_exercise.dart';

class ExercicePage extends StatefulWidget {
  const ExercicePage({super.key});

  @override
  State<ExercicePage> createState() => _ExercicePageState();
}

class _ExercicePageState extends State<ExercicePage> {

  @override
  void initState(){
    super.initState();
    context.read<ExerciseServBloc>().add(LoadExercises());
  }

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<ExerciseServBloc,ExerciseServState>(
        builder: (context,state){
          if(state is ExerciseLoading){
            return const Center(child: CircularProgressIndicator(),);
          }
          if(state is ExerciseLoaded){
            return Container(
              width: 380,
              constraints: BoxConstraints(maxWidth: 500), margin: EdgeInsets.fromLTRB(0, 31, 25, 0),
              child: ListView.builder(
                itemCount: state.exercises.length + 1,
                itemBuilder: (context, index) {
                  if (index == state.exercises.length) {
                    return Column(
                      children: [
                        CardCustomAddExo(),
                        SizedBox(height: 14),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        CardCustomExercise(exercise: state.exercises[index],),
                        SizedBox(height: 14,),
                      ],
                    );
                  }
                },
              ),
            );
          }
          return Container();
        },
        listener: (context,state){

        });
  }
}
