import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/muscle.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/exercice/create%20exercice/bloc/exercice/exercice_bloc.dart';
class CardMainMuscle extends StatelessWidget {
  final int index;
  final Muscle muscle;

  const CardMainMuscle({
    super.key,
    required this.index,
    required this.muscle,
  });

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    int langageChoice = 0;
    return BlocBuilder<ExerciceBloc, ExerciceState>(
      builder: (context, state) {
        bool isSelectedResponse = isSelected(state);
        return GestureDetector(
          onTap: (){
            if(state is ExerciceLoad){
              context.read<ExerciceBloc>().add(ExerciceModifyItemPressed(
                  exercises: state.exercises,
                  exercice: state.exercice,
                  muscle: muscle,
                  index: state.index));
            }
            if(state is ExerciceTransfer){
              context.read<ExerciceBloc>().add(ExerciceModifyItemPressed(exercises: state.exercises,
                  exercice: state.exercice,
                  muscle: muscle,
                  index: state.index));
            }
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
                  child: Image.asset(muscle.imageMuscle, fit: BoxFit.cover,),
                ),
                Text(muscle.nameMuscle[langageChoice], style: ThemesTextStyles.themes[5][themeChoice],)
              ],
            ),
          ),
        );
      },
    );
  }

  bool isSelected(ExerciceState state) {
    return state is ExerciceTransfer && state.exercice.mainMuscle == muscle
    ||
        state is ExerciceLoad && state.exercice.mainMuscle == muscle;
  }
}
