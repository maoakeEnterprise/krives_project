import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/program.dart';
import 'package:krives_project/features/appbar/services/app_bar_action_services.dart';
import 'package:krives_project/features/appbar/services/app_bar_function_services.dart';
import 'package:krives_project/core/services/function_services.dart';
import 'package:krives_project/features/exercice/create%20exercice/bloc/exercise_bloc.dart';
import 'package:krives_project/features/appbar/bloc/switch_edit_app_bar/switch_edit_app_bar_bloc.dart';
import 'package:krives_project/features/exercice/services/exercise_action_services.dart';
import 'package:krives_project/features/programme/program_user/bloc/switch_edit_programs_bloc/switch_edit_programs_bloc.dart';
import 'package:krives_project/features/programme/programme%20series/bloc/create_series_bloc/create_series_bloc.dart';
import 'package:krives_project/features/programme/programme%20series/services/service_series.dart';
import 'package:krives_project/features/programme/s_global_bloc/series/series_bloc.dart';
import 'package:krives_project/features/programme/services/services_program.dart';

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
                ExerciseActionServices.validateExercise(state ,name ,video ,context);
                AppBarActionServices.onTapMap[iconName]!(context);
                },
              icon: AppBarFunctionServices.iconMap[iconName]!
          );
        },
      );
    }


    if( iconName == "check_series"){
      return BlocBuilder<CreateSeriesBloc, CreateSeriesState>(
  builder: (context, state) {
    return IconButton(
          onPressed: (){
            ServiceSeries.validateSeries(context, state);
            AppBarActionServices.onTapMap[iconName]!(context);
            },
          icon: AppBarFunctionServices.iconMap[iconName]!
      );
  },
);
    }
    if(["edit_exercise","edit_folder_program"].contains(iconName)){
      return BlocBuilder<SwitchEditAppBarBloc, SwitchEditAppBarState>(
        builder: (context, state) {
          return IconButton(
            onPressed: (){AppBarActionServices.onTapMap[iconName]!(context);},
            icon: AppBarFunctionServices.getTheRightIconEdit(state, iconName),
          );
        },
      );
    }
    if(iconName == "edit_programs"){
      return BlocBuilder<SwitchEditProgramsBloc, SwitchEditProgramsState>(
        builder: (context, state) {
          return IconButton(
              onPressed: (){
                AppBarActionServices.onTapMap[iconName]!(context);
                },
              icon: AppBarFunctionServices.getTheRightIconEditForPrograms(state, iconName),
          );
        },
      );
    }
    ///#2.3 Servira à faire le lien avec le bloc pour créer notre programme
    if(iconName == "check_program"){
      return BlocBuilder<SeriesBloc, SeriesState>(
        builder: (context, state) {
          final arguments = FunctionServices.getArgument(context);
          TextEditingController newNameProgram = arguments.controllerNameProgram!;
          Program program = state is SeriesLoaded ? state.program : Program.initClass();
          return IconButton(
              onPressed: (){
                ServicesProgram.validateProgram(context, newNameProgram, program, arguments.nameActualInFolder!);
                AppBarActionServices.onTapMap[iconName]!(context);
                },
              icon: AppBarFunctionServices.iconMap[iconName]!
      );
  },
);
    }
    return IconButton(
        onPressed: (){
          AppBarActionServices.onTapMap[iconName]!(context);
          },
        icon: AppBarFunctionServices.iconMap[iconName]!
    );
  }
}
