import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/muscle.dart';
import 'package:krives_project/core/services_action/button_action_services.dart';
import 'package:krives_project/core/services_action/change_widget_services.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/exercice/create%20exercice/bloc/exercise_bloc.dart';
class CardMainMuscle extends StatefulWidget {
  final int index;
  final Muscle muscle;

  const CardMainMuscle({
    super.key,
    required this.index,
    required this.muscle,
  });

  @override
  State<CardMainMuscle> createState() => _CardMainMuscleState();
}

class _CardMainMuscleState extends State<CardMainMuscle> {
  int themeChoice = 0;
  int langageChoice = 0;
  bool isSelectedResponse = false;
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ExerciseBloc, ExerciseState>(
      builder: (context, state) {
        isSelectedResponse = ChangeWidgetServices.isSelectedMainMuscle(state, widget.muscle);
        return GestureDetector(
          onTap: (){
            ButtonActionServices.modifyMainMuscle(state: state, muscle: widget.muscle, context: context);
            },
          child: Container(
            width: 180,
            height: 180,
            margin: EdgeInsets.fromLTRB(0, 0, 16, 0),
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
            ),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  width: 85,
                  height: 85,
                  decoration: BoxDecoration(
                      color: ThemesColor.themes[0][themeChoice],
                      borderRadius: BorderRadius.circular(7)
                  ),
                  child: Image.asset(widget.muscle.imageMuscle, fit: BoxFit.cover,),
                ),
                Text(widget.muscle.nameMuscle[langageChoice], style: ThemesTextStyles.themes[5][themeChoice],)
              ],
            ),
          ),
        );
      },
    );
  }
}
