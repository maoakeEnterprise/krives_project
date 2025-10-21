import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/complete_series.dart';
import 'package:krives_project/core/data/datasrouces/data_class/program.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/features/programme/playtime_workout/bloc/counter_series_bloc/counter_series_bloc.dart';
import 'package:krives_project/features/programme/playtime_workout/bloc/playtime_series_bloc/playtime_series_bloc.dart';
import 'package:krives_project/features/programme/playtime_workout/bloc/timer_bloc/timer_bloc.dart';

class ButtonRemoveWidgetTimer extends StatelessWidget {
  final Program program;
  final int tmpNbSeries;
  final List<CompleteSeries> completeSeries;
  const ButtonRemoveWidgetTimer({super.key, required this.program, required this.tmpNbSeries, required this.completeSeries});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    return GestureDetector(
      onTap: (){
        context.read<PlaytimeSeriesBloc>().add(EndSerie(completeSeries: completeSeries, tmpNbSeries: tmpNbSeries, program: program));
        context.read<CounterSeriesBloc>().add(CounterSerieIncremented());
        context.read<TimerBloc>().add(TimerFinishedSeriesPressed());
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 28, 0, 0),
        child: Row(
          children: [
            SizedBox(width: 25,),
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ThemesColor.themes[0][themeChoice],
              ),
              child: Icon(Icons.horizontal_rule,
                color: ThemesColor.red1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
