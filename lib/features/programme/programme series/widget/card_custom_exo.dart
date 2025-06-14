import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/exercise.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/programme/programme%20series/bloc/create_series_bloc/create_series_bloc.dart';
import 'package:krives_project/features/programme/programme%20series/services/service_series.dart';

class CardCustomExo extends StatelessWidget {
  final int index;
  final Exercise exercise;

  const CardCustomExo({
    required this.index,
    required this.exercise,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    //int langageChoice = 0;
    return BlocBuilder<CreateSeriesBloc, CreateSeriesState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: ServiceSeries.updateExerciseSeries(state,context,exercise),
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 0, 16, 0),
            width: 180,
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
          color: ThemesColor.themes[0][themeChoice],
          boxShadow: [
            BoxShadow(
                color: Colors.black.withValues(alpha: 0.4),
                offset: Offset(1, 3),
                blurRadius: 5)
          ],
          border: Border.all(
            color: ServiceSeries.isSelectedExercise(state,exercise) ? ThemesColor.themes[4][themeChoice] : ThemesColor.themes[0][themeChoice],
            width: ServiceSeries.isSelectedExercise(state,exercise) ? 1 : 0,
          ),
        ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 85,
                  height: 85,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7)),
                  child: Image.asset(exercise.mainMuscle.imageMuscle),
                ),
                SizedBox(height: 12,),
                _textNameExo(exercise.name, 0),
                SizedBox(height: 8,),
                _muscleUsed(exercise.mainMuscle.nameMuscle[0], 0, 0),
              ],
            ),
          ),
        );
      },
    );
  }

  Text _textNameExo(String nameExo, int themeChoice) {
    return Text(nameExo,
      style: ThemesTextStyles.themes[5][themeChoice],
    );
  }

  Text _muscleUsed(String nameMuscle, int langageChoice, int themeChoice) {
    return Text(
      "${SourceLangage.titleSeriesPage[5][langageChoice]} : $nameMuscle",
      style: ThemesTextStyles.themes[0][themeChoice],
    );
  }

}
