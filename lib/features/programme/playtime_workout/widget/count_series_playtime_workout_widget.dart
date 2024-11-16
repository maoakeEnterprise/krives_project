import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/themes_color.dart';
import 'package:krives_project/core/data/datasrouces/themes_text_styles.dart';
import 'package:krives_project/features/programme/playtime_workout/widget/counter_dot_widget_playtime_workout.dart';

class CountSeriesPlaytimeWorkoutWidget extends StatelessWidget {
  const CountSeriesPlaytimeWorkoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    int langageChoice = 0;
    return Container(
      margin: EdgeInsets.fromLTRB(25, 10, 0, 0),
      child: Row(
        children: [
          Text("Séries",style: ThemesTextStyles.themes[1][themeChoice],),
          SizedBox(width: 18,),
          CounterDotWidgetPlaytimeWorkout(),
          CounterDotWidgetPlaytimeWorkout(),
          CounterDotWidgetPlaytimeWorkout(),
          CounterDotWidgetPlaytimeWorkout(),
          CounterDotWidgetPlaytimeWorkout(),
        ],
      ),
    );
  }
}
