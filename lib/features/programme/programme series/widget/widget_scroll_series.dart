import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/features/exercice/exercice_main/bloc/bloc_exercise_services/exercise_serv_bloc.dart';
import 'package:krives_project/features/programme/programme%20series/widget/card_custom_exo.dart';

class WidgetScrollSeries extends StatelessWidget {
  const WidgetScrollSeries({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 222,
      child: BlocBuilder<ExerciseServBloc, ExerciseServState>(
        builder: (context, state) {
          if(state is ExerciseLoaded){
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.exercises.length,
                padding: EdgeInsets.fromLTRB(8, 10, 0, 32),
                itemBuilder: (context, index) {
                  return CardCustomExo(index: index,exercise: state.exercises[index],);
                });
          }
          return Container();

        },
      ),
    );
  }
}
