import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/data_class/muscle.dart';
import 'package:krives_project/features/appbar/bloc/switch_edit_app_bar/switch_edit_app_bar_bloc.dart';
import 'package:krives_project/features/exercice/create%20exercice/bloc/exercise_bloc.dart';

class ExerciseFunctionServices{

  ///send a boolean to confirm if this cardMuscle is selected
  static bool isSelectedMainMuscle(ExerciseState state,Muscle muscle) {
    return state.exercise.mainMuscle == muscle;
  }
  ///send a boolean to confirm if this cardMuscle is selected
  static bool isSelectedSecondaryMuscle(ExerciseState state,Muscle muscle) {
    return state.exercise.secondariesMuscles.contains(muscle);
  }



  ///to see if we are in EditMod Or DeleteMode
  static IconData isEditOrDeleteExerciseIconData(SwitchEditAppBarState state){
    return state is EditOff ? Icons.settings : Icons.delete;
  }
  static bool isEditOrDeleteModeExercise(SwitchEditAppBarState state){
    return state is EditOff;
  }

  static TextEditingController resetControllersExercise(ExerciseState state,TextEditingController controller) {
    if(!state.isTransfering){
      return controller;
    }
    controller.text = state.exercise.name;
    return controller;
  }

}