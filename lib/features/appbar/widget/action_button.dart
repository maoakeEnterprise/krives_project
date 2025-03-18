import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/services_action/app_bar_button_services.dart';
import 'package:krives_project/core/services_action/button_action_services.dart';
import 'package:krives_project/core/services_action/function_services.dart';
import 'package:krives_project/features/exercice/create%20exercice/bloc/exercise_bloc.dart';
import 'package:krives_project/features/appbar/bloc/switch_edit_app_bar/switch_edit_app_bar_bloc.dart';
import 'package:krives_project/features/programme/program_user/bloc/switch_edit_programs_bloc/switch_edit_programs_bloc.dart';

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
      /// its the button edit he is here to put an edit on some object on the page.
      /// he is here to add the button delete on the card present in the page
      return BlocBuilder<SwitchEditAppBarBloc, SwitchEditAppBarState>(
        builder: (context, state) {
          return IconButton(
              onPressed: (){AppBarButtonServices.onTapMap[iconName]!(context);},
              icon: state is EditOff ? AppBarButtonServices.iconMap[iconName]! : AppBarButtonServices.iconMap["back"]!
          );
        },
      );
    }
    if(iconName == "edit_programs"){
      return BlocBuilder<SwitchEditProgramsBloc, SwitchEditProgramsState>(
        builder: (context, state) {
          return IconButton(
              onPressed: (){AppBarButtonServices.onTapMap[iconName]!(context);},
              icon: state is ProgramsEditOff ? AppBarButtonServices.iconMap[iconName]! : AppBarButtonServices.iconMap["back"]!
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
