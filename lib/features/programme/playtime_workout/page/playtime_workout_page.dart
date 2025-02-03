
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/programme/playtime_workout/bloc/timer_bloc/timer_bloc.dart';
import 'package:krives_project/features/programme/playtime_workout/widget/button_finish_serie_playtime_workout.dart';
import 'package:krives_project/features/programme/playtime_workout/widget/button_remove_widget_timer.dart';
import 'package:krives_project/features/programme/playtime_workout/widget/circular_timer.dart';
import 'package:krives_project/features/programme/playtime_workout/widget/commentary_exo_widget_playtime_workout.dart';
import 'package:krives_project/features/programme/playtime_workout/widget/count_series_playtime_workout_widget.dart';
import 'package:krives_project/features/programme/playtime_workout/widget/detail_weight_rep_widget_playtime_workout.dart';

class PlaytimeWorkoutPage extends StatefulWidget {
  const PlaytimeWorkoutPage({super.key});

  @override
  State<PlaytimeWorkoutPage> createState() => _PlaytimeWorkoutPageState();
}

class _PlaytimeWorkoutPageState extends State<PlaytimeWorkoutPage> {
  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    return ListView(
      children: [
        SizedBox(height: 24,),
        Container(
            margin: EdgeInsets.fromLTRB(13, 0, 0, 0),
            child: Text(
              "Nom exercice", style: ThemesTextStyles.themes[5][themeChoice],)
        ),
        CountSeriesPlaytimeWorkoutWidget(),
        CommentaryExoWidgetPlaytimeWorkout(),
        DetailWeightRepWidgetPlaytimeWorkout(),
        BlocBuilder<TimerBloc, TimerState>(
          builder: (context, state) {
            return state is TimerIsNotDisplayed ?ButtonFinishSeriePlaytimeWorkout() : ButtonRemoveWidgetTimer();
          },
        ),
        BlocBuilder<TimerBloc, TimerState>(
          builder: (context, state) {
            return _isTimerWidgetDisplayed(context, state);
          },
        ),
      ],
    );
  }

  Widget _isTimerWidgetDisplayed(BuildContext context, TimerState state) {
    return state is TimerIsDisplayed ?
    CircularTimer(
      initialDuration: 10,
      color: ThemesColor.green1,
      backgroundColor: ThemesColor.green1.withAlpha(10),
    ) : Container();
  }
}
