import 'package:flutter/material.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/features/appbar/bloc/switch_edit_app_bar/switch_edit_app_bar_bloc.dart';
import 'package:krives_project/features/appbar/widget/action_button.dart';
import 'package:krives_project/features/programme/program_user/bloc/switch_edit_programs_bloc/switch_edit_programs_bloc.dart';

class AppBarFunctionServices {

  static Map<String, Icon> iconMap = {
    "edit_folder_program": Icon(Icons.edit),
    "edit_exercise": Icon(Icons.edit),
    "edit_programs": Icon(Icons.edit),
    "back": Icon(Icons.arrow_back_ios_new),
    "check_program": Icon(Icons.check_circle,color: ThemesColor.green1,size: 30,),
    "check_exercice": Icon(Icons.check_circle,color: ThemesColor.green1,size: 30,),
    "check_series": Icon(Icons.check_circle,color: ThemesColor.green1,size: 30,),
  };

  static List<Widget> getTheRightActionButton(BuildContext context,bool isCheckExoButton,bool isCheckSeriesButton,bool isCheckProgramButton,bool isEditProgramsButton, bool isEditFolderProgram, bool isEditExercise){

    List<Widget> actions = [
      if(isCheckSeriesButton)
        ActionButton(iconName: 'check_series',),
      if(isCheckExoButton)
        ActionButton(iconName: 'check_exercice',),
      if(isCheckProgramButton)
        ActionButton(iconName: 'check_program',),
      if(isEditProgramsButton)
        ActionButton(iconName: 'edit_programs',),
      if(isEditFolderProgram)
        ActionButton(iconName: 'edit_folder_program',),
      if(isEditExercise)
        ActionButton(iconName: 'edit_exercise',),
    ];
    return actions;

  }

  static Icon getTheRightIconEdit(SwitchEditAppBarState state,String iconName){
    return state is EditOff ? AppBarFunctionServices.iconMap[iconName]! : AppBarFunctionServices.iconMap["back"]!;
  }

  static Icon getTheRightIconEditForPrograms(SwitchEditProgramsState state,String iconName){
    return state is ProgramsEditOff ? AppBarFunctionServices.iconMap[iconName]! : AppBarFunctionServices.iconMap["back"]!;
  }

}