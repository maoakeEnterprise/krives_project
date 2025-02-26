import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/features/exercice/exercice_main/bloc/switch_edit_exo/switch_edit_exo_bloc.dart';

class AppBarButtonServices {

  static Map<String, Icon> iconMap = {
    "edit": Icon(Icons.edit),
    "back": Icon(Icons.arrow_back_ios_new),
    "check_program": Icon(Icons.check_circle,color: ThemesColor.green1,size: 30,),
    "check_exercice": Icon(Icons.check_circle,color: ThemesColor.green1,size: 30,),
    "check_series": Icon(Icons.check_circle,color: ThemesColor.green1,size: 30,),
  };

  static Map<String, void Function(BuildContext context)> onTapMap = {
    "edit": (BuildContext context){context.read<SwitchEditExoBloc>().add(SwitchEditExoEventPressed());},
    "check_program": (BuildContext context){
      /*showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context){
            return PopUpDelete();
          }
      );*/
      Navigator.of(context).pop();
    },
    "check_exercice": (BuildContext context){
      Navigator.of(context).pop();
    },
    "check_series": (BuildContext context){},
  };
}