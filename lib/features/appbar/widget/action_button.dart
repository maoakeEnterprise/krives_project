import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/features/exercice/exercice_main/bloc/switch_edit_exo_bloc.dart';
import 'package:krives_project/features/popup_dialog/page/pop_up_delete.dart';

class ActionButton extends StatelessWidget {
  final String iconName;

  static Map<String, Icon> iconMap = {
  "edit": Icon(Icons.edit),
  "back": Icon(Icons.arrow_back_ios_new),
  "delete": Icon(Icons.delete),
  "check": Icon(Icons.check_circle,color: ThemesColor.green1,size: 30,),
  };

  static Map<String, void Function(BuildContext context)> onTapMap = {
    "edit": (BuildContext context){context.read<SwitchEditExoBloc>().add(SwitchEditExoEventPressed());},
    "delete": (BuildContext context){
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context){
            return PopUpDelete();
          }
      );
    },
    "check": (BuildContext context){},
  };


  const ActionButton({
    required this.iconName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchEditExoBloc, SwitchEditExoState>(
      builder: (context, state) {
        if(iconName == "edit"){
          return IconButton(
              onPressed: (){_getOnTap(iconName, context);},
              icon: state is SwitchEditExoOff ? _getIconName(iconName) : _getIconName("back")
          );
        }
        return IconButton(
            onPressed: (){_getOnTap(iconName, context);},
            icon: _getIconName(iconName)
          );
        },
    );
  }

  Icon _getIconName(String iconName){
    return iconMap[iconName] is Icon ? iconMap[iconName]! : Icon(Icons.error);
  }
  void _getOnTap(String iconName, BuildContext context){
    return onTapMap[iconName] is void Function(BuildContext context) ? onTapMap[iconName]!(context) : (){};
  }
}
