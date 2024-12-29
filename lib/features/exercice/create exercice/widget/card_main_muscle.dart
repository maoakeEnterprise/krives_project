import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/exercice/create%20exercice/bloc/main_muscle/main_muscle_bloc.dart';

class CardMainMuscle extends StatelessWidget {
  final int index;

  const CardMainMuscle({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    return GestureDetector(
      onTap: () {context.read<MainMuscleBloc>().add(MainMuscleSelect(index: index));},
      child: BlocBuilder<MainMuscleBloc, MainMuscleState>(
        builder: (context, state) {
          bool isSelectedResponse = isSelected(state);
          return Container(
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
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7)
                  ),
                ),
                Text("Pec", style: ThemesTextStyles.themes[5][themeChoice],)
              ],
            ),
          );
        },
      ),
    );
  }

  bool isSelected(MainMuscleState state) {
    return state is MainMuscleSelected && state.index == index;
  }
}
