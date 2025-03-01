import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/muscle.dart';
import 'package:krives_project/core/services_action/button_action_services.dart';
import 'package:krives_project/core/services_action/change_widget_services.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/exercice/create%20exercice/bloc/exercise_bloc.dart';

class CardSecondaryMuscle extends StatelessWidget {
  final int index;
  final Muscle muscle;

  const CardSecondaryMuscle({
    super.key,
    required this.index,
    required this.muscle,
  });

  @override
  Widget build(BuildContext context) {
    int langageChoice = 0;
    int themeChoice = 0;
    return BlocBuilder<ExerciseBloc, ExerciseState>(
      builder: (context, state) {
        bool isSelectedResponse = ChangeWidgetServices.isSelectedSecondaryMuscle(state, muscle);
        return GestureDetector(
          onTap: () {
            ButtonActionServices.modifySecondaryMuscle(state: state, muscle: muscle, context: context);
            },
          child: Container(
            width: 100,
            height: 100,
            margin: EdgeInsets.fromLTRB(0, 0, 26, 0),
            decoration: BoxDecoration(
                color: ThemesColor.themes[0][themeChoice],
                borderRadius: BorderRadius.circular(12),
                boxShadow: [ BoxShadow(
                    color: Colors.black,
                    offset: Offset(1, 3),
                    blurRadius: 5
                )
                ],
              border: Border.all(
                color: isSelectedResponse ? ThemesColor.themes[4][themeChoice] : ThemesColor.themes[0][themeChoice],
                width: isSelectedResponse ? 1 : 0,
              )
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 18),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7)
                  ),
                  child: Image.asset(muscle.imageMuscle,fit: BoxFit.cover,),
                ),
                Text(muscle.nameMuscle[langageChoice], style: ThemesTextStyles.themes[5][themeChoice],)
              ],
            ),
          ),
        );
      },
    );
  }

}
