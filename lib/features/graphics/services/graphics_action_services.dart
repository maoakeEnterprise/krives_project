import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/exercise.dart';
import 'package:krives_project/features/graphics/bloc/graphics_bloc/graphics_data_bloc.dart';

class GraphicsActionServices {

  static VoidCallback selectingThisExercise(String idExercise, List<Exercise> listExercises, BuildContext context){
    return (){
      context.read<GraphicsDataBloc>().add(GetOneBackTrackExercise(idExerciseSelected: idExercise, listExercise: listExercises));
    };
  }

}