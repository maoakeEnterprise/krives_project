import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/route_argument.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/features/exercice/create%20exercice/bloc/exercice/exercice_bloc.dart';
import 'package:krives_project/features/exercice/exercice_main/bloc/switch_edit_exo_bloc.dart';

class ActionButton extends StatelessWidget {
  final String iconName;

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

  const ActionButton({
    required this.iconName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if( iconName == "check_exercice"){

      final arguments = ModalRoute.of(context)?.settings.arguments as RouteArgument;
      TextEditingController nameController = arguments.controllerNameExercice!;
      TextEditingController videoController = arguments.controllerCommentaryExercice!;

      return BlocBuilder<ExerciceBloc, ExerciceState>(
        builder: (context,state){
          return IconButton(
              onPressed: (){
                _onTapButtonExerciceValidate(context, state, nameController, videoController);
                _getOnTap(iconName, context);
                },
              icon: _getIconName(iconName)
          );
        },
      );
    }
    if( iconName == "check_series"){

      return IconButton(
          onPressed: (){_getOnTap(iconName, context);},
          icon: _getIconName(iconName)
      );

    }
    if(iconName == "edit"){

      return BlocBuilder<SwitchEditExoBloc, SwitchEditExoState>(
        builder: (context, state) {
          return IconButton(
              onPressed: (){_getOnTap(iconName, context);},
              icon: state is SwitchEditExoOff ? _getIconName(iconName) : _getIconName("back")
          );
        },
      );
    }

    return IconButton(
        onPressed: (){_getOnTap(iconName, context);},
        icon: _getIconName(iconName)
    );
  }

  Icon _getIconName(String iconName){
    return iconMap[iconName] is Icon ? iconMap[iconName]! : Icon(Icons.error);
  }
  void _getOnTap(String iconName, BuildContext context){
    return onTapMap[iconName] is void Function(BuildContext context) ? onTapMap[iconName]!(context) : (){};
  }

  void _onTapButtonExerciceValidate(BuildContext context,ExerciceState state,TextEditingController nameController, TextEditingController videoController){
    if(state is ExerciceTransfer){
      if(state.index != null){
        context.read<ExerciceBloc>().add(ConfirmExercice(
            exercice: state.exercice,
            exercises: state.exercises,
            index: state.index,
            nameExercice: nameController.text,
            commentaryExercice: videoController.text
        ));
      }
      else {
        context.read<ExerciceBloc>().add(ConfirmExercice(
            exercice: state.exercice,
            exercises: state.exercises,
            nameExercice: nameController.text,
            commentaryExercice: videoController.text
        ));
      }
    }
    if(state is ExerciceLoad){
      if(state.index != null){
        context.read<ExerciceBloc>().add(ConfirmExercice(
            exercice: state.exercice,
            exercises: state.exercises,
            index: state.index,
            nameExercice: nameController.text,
            commentaryExercice: videoController.text
        ));
      }
      else {
        context.read<ExerciceBloc>().add(ConfirmExercice(
            exercice: state.exercice,
            exercises: state.exercises,
            nameExercice: nameController.text,
            commentaryExercice: videoController.text
        ));
      }
    }
  }
}
