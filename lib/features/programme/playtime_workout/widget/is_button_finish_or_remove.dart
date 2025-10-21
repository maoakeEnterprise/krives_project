import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/complete_series.dart';
import 'package:krives_project/core/data/datasrouces/data_class/program.dart';
import 'package:krives_project/features/programme/playtime_workout/bloc/timer_bloc/timer_bloc.dart';
import 'package:krives_project/features/programme/playtime_workout/widget/button_finish_serie_playtime_workout.dart';
import 'package:krives_project/features/programme/playtime_workout/widget/button_remove_widget_timer.dart';

class IsButtonFinishOrRemove extends StatelessWidget {
  final int tmpNbSeries;
  final List<CompleteSeries> completeSeries;
  final Program program;
  const IsButtonFinishOrRemove({super.key, required this.tmpNbSeries, required this.completeSeries, required this.program});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      builder: (context, state) {
        return state is TimerIsNotDisplayed
            ? ButtonFinishSeriePlaytimeWorkout()
            : ButtonRemoveWidgetTimer(tmpNbSeries: tmpNbSeries, completeSeries: completeSeries, program: program,);
      },
    );
  }
}
