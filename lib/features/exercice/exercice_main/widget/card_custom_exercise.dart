import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/exercise.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/core/data/repositories/card_custom_color1.dart';
import 'package:krives_project/features/appbar/bloc/switch_edit_app_bar/switch_edit_app_bar_bloc.dart';
import 'package:krives_project/features/exercice/services/exercise_action_services.dart';
import 'package:krives_project/features/exercice/services/exercise_function_services.dart';

class CardCustomExercise extends StatelessWidget {
  final Exercise exercise;
  const CardCustomExercise({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    int langageChoice = 0;
    int themeChoice = 0;
    Image imgMuscle =Image.asset(exercise.mainMuscle.imageMuscle, fit: BoxFit.cover,);

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
                  BlocBuilder<SwitchEditAppBarBloc, SwitchEditAppBarState>(
                    builder: (context, state) {
                      return IconButton(
                        onPressed: ExerciseActionServices.isSettingOrDeleteExerciseFunction(context, state, exercise),
                        icon: Icon(ExerciseFunctionServices.isEditOrDeleteExerciseIconData(state),
                          size: 20,
                          color: ThemesColor.themes[7][themeChoice],),
                      );
                    },
                  ),
                ],
              ),
              Text(exercise.name, style: ThemesTextStyles.themes[5][themeChoice],),
              SizedBox(height: 10,),
              Text(exercise.mainMuscle.nameMuscle[langageChoice], style: ThemesTextStyles.themes[3][themeChoice],),
              SizedBox(
                width: 190,
                child: Text(
                  exercise.video,
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
}
