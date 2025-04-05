import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/features/appbar/bloc/switch_edit_app_bar/switch_edit_app_bar_bloc.dart';
import 'package:krives_project/features/programme/program_user/bloc/switch_edit_programs_bloc/switch_edit_programs_bloc.dart';

class AppBarActionServices {

  static Map<String, void Function(BuildContext context)> onTapMap = {

    "edit": (BuildContext context) {
      context.read<SwitchEditAppBarBloc>().add(ButtonEditPressed());
      },

    "edit_programs": (BuildContext context){
      context.read<SwitchEditProgramsBloc>().add(ProgramsButtonEditPressed());
      },

    "check_program": (BuildContext context){
      Navigator.of(context).pop();
    },

    "check_exercice": (BuildContext context){
      Navigator.of(context).pop();
    },

    "check_series": (BuildContext context){

    },

  };

}