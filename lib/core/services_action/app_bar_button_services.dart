import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/features/appbar/bloc/action_button/action_button_bloc.dart';
import 'package:krives_project/features/appbar/bloc/switch_edit_app_bar/switch_edit_app_bar_bloc.dart';
import 'package:krives_project/features/appbar/widget/action_button.dart';
import 'package:krives_project/features/programme/program_user/bloc/switch_edit_programs_bloc/switch_edit_programs_bloc.dart';

class AppBarButtonServices {

  static Map<String, Icon> iconMap = {
    "edit": Icon(Icons.edit),
    "edit_programs": Icon(Icons.edit),
    "back": Icon(Icons.arrow_back_ios_new),
    "check_program": Icon(Icons.check_circle,color: ThemesColor.green1,size: 30,),
    "check_exercice": Icon(Icons.check_circle,color: ThemesColor.green1,size: 30,),
    "check_series": Icon(Icons.check_circle,color: ThemesColor.green1,size: 30,),
  };

  static Map<String, void Function(BuildContext context)> onTapMap = {
    "edit": (BuildContext context){context.read<SwitchEditAppBarBloc>().add(ButtonEditPressed());},
    "edit_programs": (BuildContext context){context.read<SwitchEditProgramsBloc>().add(ProgramsButtonEditPressed());},
    "check_program": (BuildContext context){
      Navigator.of(context).pop();
    },
    "check_exercice": (BuildContext context){
      Navigator.of(context).pop();
    },
    "check_series": (BuildContext context){},
  };

  static String getTheRightNameButton(ActionButtonState state){
    if(state is ActionButtonEdit) {return 'edit';}
    else if(state is ActionButtonDelete) {return 'delete';}
    else if(state is ActionButtonValidate) {return 'check';}
    return 'null';

  }

  static List<Widget> getTheRightActionButton(BuildContext context,bool isCreateExoButton,bool isCreateSeriesButton,bool isProgramButton,bool isEditProgramsButton){

    List<Widget> actions = [
      if(isCreateSeriesButton)
        ActionButton(iconName: 'check_series',),
      if(isCreateExoButton)
        ActionButton(iconName: 'check_exercice',),
      if(isProgramButton)
        ActionButton(iconName: 'check_program',),
      if(isEditProgramsButton)
        ActionButton(iconName: 'edit_programs',),
      if(!isCreateExoButton && !isCreateSeriesButton && !isEditProgramsButton)
        BlocBuilder<ActionButtonBloc, ActionButtonState>(
          builder: (context, state) {
            String buttonName;
            buttonName = getTheRightNameButton(state);
            return buttonName != 'null' ? ActionButton(iconName: buttonName,) : Container();
          },
        ),
    ];
    return actions;

  }

}