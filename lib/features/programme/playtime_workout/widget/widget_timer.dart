import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/complete_series.dart';
import 'package:krives_project/core/data/datasrouces/data_class/program.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/features/programme/playtime_workout/bloc/timer_bloc/timer_bloc.dart';
import 'package:krives_project/features/programme/playtime_workout/widget/circular_timer.dart';

class WidgetTimer extends StatefulWidget {
  final int tmpNbSeries;
  final List<CompleteSeries> completeSeries;
  final Program program;
  const WidgetTimer({super.key, required this.tmpNbSeries, required this.completeSeries, required this.program});

  @override
  State<WidgetTimer> createState() => _WidgetTimerState();
}

class _WidgetTimerState extends State<WidgetTimer> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      builder: (context, state) {
        return state is TimerIsDisplayed ?
        CircularTimer(
          initialDuration: 10,
          color: ThemesColor.green1,
          backgroundColor: ThemesColor.green1.withAlpha(10),
          program: widget.program,
          completeSeries: widget.completeSeries,
          tmpNbSeries: widget.tmpNbSeries,
        ) : Container();
      },
    );
  }
}
