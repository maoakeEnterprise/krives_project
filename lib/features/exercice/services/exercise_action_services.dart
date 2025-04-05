

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/exercise.dart';
import 'package:krives_project/core/data/datasrouces/data_class/muscle.dart';
import 'package:krives_project/core/data/datasrouces/data_class/route_argument.dart';
import 'package:krives_project/core/services/button_action_services.dart';
import 'package:krives_project/features/appbar/bloc/switch_edit_app_bar/switch_edit_app_bar_bloc.dart';
import 'package:krives_project/features/exercice/create%20exercice/bloc/exercise_bloc.dart';
import 'package:krives_project/features/exercice/exercice_main/bloc/bloc_exercise_services/exercise_serv_bloc.dart';
import 'package:krives_project/features/exercice/services/exercise_function_services.dart';
import 'package:krives_project/features/popup_dialog/page/pop_up_delete.dart';

class ExerciseActionServices {

  /// this function is used to addNewExercise
  static  VoidCallback addNewExercise(BuildContext context,TextEditingController name, TextEditingController video){
    return (){
      context.read<SwitchEditAppBarBloc>().add(InitEventEdit());///we send order to he SwitchEditAppBarBloc to put his state in mode Edit and not in mode Delete
      context.read<ExerciseBloc>().add(NewExercise());///we set up in the ExerciseBloc to create a create a new exercise : Exercise.initExercise()
      ButtonActionServices.navigateToPage(context, 'exercise', /// and with set up finish we navigate to page who will create the new exercise.
          RouteArgument(titlePage: "Exercise",isCreateExoButton: true,
              controllerNameExercice: name,
              controllerCommentaryExercice: video));
    };
  }

  static VoidCallback modifySecondaryMuscle({required ExerciseState state, required Muscle muscle, required BuildContext context}){
    return (){
      state.exercise.addOrRemoveMuscle(muscle);
      context.read<ExerciseBloc>().add(ModifyItemPressed(exercise: state.exercise, isNewExercise: state.isNewExercise));
    };
  }

  static VoidCallback modifyMainMuscle({required ExerciseState state, required Muscle muscle, required BuildContext context}){
    return (){
      state.exercise.mainMuscle = muscle;
      context.read<ExerciseBloc>().add(ModifyItemPressed(exercise: state.exercise, isNewExercise: state.isNewExercise));
    };
  }

  static void validateExercise(ExerciseState state, TextEditingController name, TextEditingController video, BuildContext context){
    state.exercise.name = name.text;
    state.exercise.video = video.text;
    context.read<ExerciseServBloc>().add(state.isNewExercise ? AddExercise(exercise: state.exercise) : ModifyExercise(exercise: state.exercise));
  }

  static VoidCallback settingsExercise(BuildContext context, Exercise exercise){
    return (){
      TextEditingController name = TextEditingController();
      TextEditingController video = TextEditingController();
      ButtonActionServices.navigateToPage(
          context,
          'exercise',
          RouteArgument(
            titlePage: exercise.name,
            isCreateExoButton: true,
            controllerNameExercice: name,
            controllerCommentaryExercice: video,
          ));
      context.read<ExerciseBloc>().add(ExerciseItemSelected(exercise: exercise));
    };
  }

  static VoidCallback isPopUpDeleteExercise(BuildContext context,Exercise exercise){
    return (){
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context){
            return PopUpDelete(exercise: exercise,);
          }
      );
    };
  }


  static VoidCallback deleteExercise(BuildContext context, Exercise exercise){
    return (){
      context.read<ExerciseServBloc>().add(DeleteExercise(exercise: exercise));
      Navigator.of(context).pop();
    };
  }

  static VoidCallback isSettingOrDeleteExerciseFunction(BuildContext context,SwitchEditAppBarState state,Exercise exercise){
    return ExerciseFunctionServices.isEditOrDeleteModeExercise(state) ?
    settingsExercise(context, exercise)
        :
    isPopUpDeleteExercise(context, exercise);
  }

  static VoidCallback isConfirmDeleteOrCancelButtonExercise(BuildContext context,Exercise exercise,bool isConfirmDelete){
    return isConfirmDelete ? deleteExercise(context, exercise) : ButtonActionServices.closePopUp(context);
  }


}