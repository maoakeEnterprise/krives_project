import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/services_action/app_bar_button_services.dart';
import 'package:krives_project/core/services_action/button_action_services.dart';
import 'package:krives_project/core/services_action/function_services.dart';
import 'package:krives_project/features/exercice/create%20exercice/bloc/exercise_bloc.dart';
import 'package:krives_project/features/exercice/exercice_main/bloc/switch_edit_exo/switch_edit_exo_bloc.dart';

class ActionButton extends StatelessWidget {
  final String iconName;

  const ActionButton({
    required this.iconName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    if( iconName == "check_exercice"){
      final arguments = FunctionServices.getArgument(context);
      TextEditingController name = arguments.controllerNameExercice!;
      TextEditingController video = arguments.controllerCommentaryExercice!;

      return BlocBuilder<ExerciseBloc, ExerciseState>(
        builder: (context,state){
          return IconButton(
              onPressed: (){
                log(name.text);
                log(video.text);
                ButtonActionServices.validateExercise(state ,name ,video ,context);
                AppBarButtonServices.onTapMap[iconName]!(context);
                },
              icon: AppBarButtonServices.iconMap[iconName]!
          );
        },
      );
    }


    if( iconName == "check_series"){
      return IconButton(
          onPressed: (){AppBarButtonServices.onTapMap[iconName]!(context);},
          icon: AppBarButtonServices.iconMap[iconName]!
      );
    }
    if(iconName == "edit"){

      return BlocBuilder<SwitchEditExoBloc, SwitchEditExoState>(
        builder: (context, state) {
          return IconButton(
              onPressed: (){AppBarButtonServices.onTapMap[iconName]!(context);},
              icon: state is SwitchEditExoOff ? AppBarButtonServices.iconMap[iconName]! : AppBarButtonServices.iconMap["back"]!
          );
        },
      );
    }
    return IconButton(
        onPressed: (){AppBarButtonServices.onTapMap[iconName]!(context);},
        icon: AppBarButtonServices.iconMap[iconName]!
    );
  }
}
