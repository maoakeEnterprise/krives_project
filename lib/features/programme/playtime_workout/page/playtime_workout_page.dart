import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/themes_text_styles.dart';
import 'package:krives_project/features/programme/playtime_workout/widget/button_finish_serie_playtime_workout.dart';
import 'package:krives_project/features/programme/playtime_workout/widget/commentary_exo_widget_playtime_workout.dart';
import 'package:krives_project/features/programme/playtime_workout/widget/count_series_playtime_workout_widget.dart';
import 'package:krives_project/features/programme/playtime_workout/widget/detail_weight_rep_widget_playtime_workout.dart';

class PlaytimeWorkoutPage extends StatelessWidget {
  const PlaytimeWorkoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    return ListView(
      children: [
        SizedBox(height: 24,),
        Container(
            margin: EdgeInsets.fromLTRB(13, 0, 0, 0),
            child: Text("Nom exercice",style: ThemesTextStyles.themes[5][themeChoice],)
        ),
        CountSeriesPlaytimeWorkoutWidget(),
        CommentaryExoWidgetPlaytimeWorkout(),
        DetailWeightRepWidgetPlaytimeWorkout(),
        ButtonFinishSeriePlaytimeWorkout(),
      ],
    );
  }
}
