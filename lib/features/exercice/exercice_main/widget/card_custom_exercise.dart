import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/exercice.dart';
import 'package:krives_project/core/data/datasrouces/data_class/exercices.dart';
import 'package:krives_project/core/data/datasrouces/data_class/route_argument.dart';
import 'package:krives_project/core/functions/function.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/core/data/repositories/card_custom_color1.dart';
import 'package:krives_project/features/exercice/create%20exercice/bloc/exercice/exercice_bloc.dart';
import 'package:krives_project/features/exercice/exercice_main/bloc/switch_edit_exo_bloc.dart';
import 'package:krives_project/features/popup_dialog/page/pop_up_delete.dart';

class CardCustomExercise extends StatelessWidget {
  final Exercises exercices;
  final Exercice exercice;
  final int index;
  const CardCustomExercise({super.key, required this.exercice, required this.exercices,required this.index});

  @override
  Widget build(BuildContext context) {
    int langageChoice = 0;
    int themeChoice = 0;
    Image imgMuscle =Image.asset(exercice.mainMuscle.imageMuscle, fit: BoxFit.cover,);

    return CardCustomColor1(
      width: 380,
      height: 170,
      left: 19,
      child: Row(
        children: [
          SizedBox(width: 22,),
          Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              //color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: imgMuscle,
          ),
          SizedBox(width: 22,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(width: 150,),
                  BlocBuilder<SwitchEditExoBloc, SwitchEditExoState>(
                    builder: (context, state) {
                      bool isEditResponse = _isEdit(state);
                      return IconButton(
                        onPressed: isEditResponse ? _settingsOnPressed(context) : _deleteOnPressed(context),
                        icon: Icon(isEditResponse ? Icons.settings : Icons.delete,
                          size: 20,
                          color: ThemesColor.themes[7][themeChoice],),
                      );
                    },
                  ),
                ],
              ),
              Text(exercice.name, style: ThemesTextStyles.themes[5][themeChoice],),
              SizedBox(height: 10,),
              Text(exercice.mainMuscle.nameMuscle[langageChoice], style: ThemesTextStyles.themes[3][themeChoice],),
              SizedBox(
                width: 190,
                child: Text(
                  exercice.video,
                  style: ThemesTextStyles.themes[4][themeChoice],
                  softWrap: true,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          )

        ],
      ),
    );
  }

  /*IconButton _switchEditExoButton(BuildContext context, SwitchEditExoState state) {
    return IconButton(
      onPressed: (){},
      icon: Icon(Icons.error),
    );
  }*/

  bool _isEdit(SwitchEditExoState state){
    return state is SwitchEditExoOff;
  }
  VoidCallback _settingsOnPressed(BuildContext context){
    TextEditingController nameController = TextEditingController();
    TextEditingController videoController = TextEditingController();
    return (){
      context.read<ExerciceBloc>().add(ExerciceItemSelected(exercice: exercice,exercises: exercices,index: index));
      navigateToPage(context, 'exercise', RouteArgument(
          titlePage: exercice.name, isCreateExoButton: true,controllerNameExercice: nameController,controllerCommentaryExercice: videoController));
    };
  }
  VoidCallback _deleteOnPressed(BuildContext context){
    return (){
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context){
            return PopUpDelete(isExerciceDelete: true,exercises: exercices,index: index,);
          }
      );
    };
  }
}
