import 'package:flutter/cupertino.dart';
import 'package:krives_project/core/data/datasrouces/data_class/muscle.dart';
import 'package:krives_project/features/exercice/create%20exercice/bloc/print_exercise/print_exercise_bloc.dart';
import 'package:krives_project/features/exercice/exercice_main/bloc/switch_edit_exo/switch_edit_exo_bloc.dart';

class ChangeWidgetServices {

  static bool isSelectedMainMuscle(PrintExerciseState state,Muscle muscle) {
    return state.exercise.mainMuscle == muscle;
  }
  static bool isSelectedSecondaryMuscle(PrintExerciseState state,Muscle muscle) {
    return state.exercise.secondariesMuscles.contains(muscle);
  }

  static TextEditingController resetControllersExercise(PrintExerciseState state,TextEditingController controller) {
    if(!state.isTransfering){
      return controller;
    }
    controller.text = state.exercise.name;
    return controller;
  }

  static bool isEditOrDeleteModeExercise(SwitchEditExoState state) {return state is SwitchEditExoOff;}


}