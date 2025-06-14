import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/programme/playtime_workout/widget/counter_dot_widget_playtime_workout.dart';

class CountSeriesPlaytimeWorkoutWidget extends StatelessWidget {
  final int numberMaxSeries;
  final int numberCounter;
  const CountSeriesPlaytimeWorkoutWidget({super.key,required this.numberMaxSeries, required this.numberCounter});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    int langageChoice = 0;
    return Container(
      margin: EdgeInsets.fromLTRB(25, 10, 0, 0),
      child: Row(
        children: [
          Text(_getText(0, langageChoice), style: ThemesTextStyles.themes[1][themeChoice],),
          SizedBox(width: 18,),
          ...List.generate(numberMaxSeries, (index) =>  CounterDotWidgetPlaytimeWorkout(isDone: index < numberCounter)),
        ],
      ),
    );
  }

  String _getText(int index, int langageChoice) {
    return SourceLangage.titleProgrammLangage[index][langageChoice];
  }
}
