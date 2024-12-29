import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/features/programme/playtime_workout/bloc/counter_series_bloc/counter_series_bloc.dart';
import 'package:krives_project/features/programme/playtime_workout/bloc/timer_bloc/timer_bloc.dart';

class ButtonRemoveWidgetTimer extends StatelessWidget {
  const ButtonRemoveWidgetTimer({super.key});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    return GestureDetector(
      onTap: (){
        context.read<TimerBloc>().add(TimerFinishedSeriesPressed());
        context.read<CounterSeriesBloc>().add(CounterSerieIncremented());
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
