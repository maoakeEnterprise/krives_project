import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/programme/playtime_workout/bloc/counter_series_bloc/counter_series_bloc.dart';
import 'package:krives_project/features/programme/playtime_workout/widget/counter_dot_widget_playtime_workout.dart';

class CountSeriesPlaytimeWorkoutWidget extends StatelessWidget {
  const CountSeriesPlaytimeWorkoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    int langageChoice = 0;
    int numberMaxSeries = 5;
    int counter;
    return Container(
      margin: EdgeInsets.fromLTRB(25, 10, 0, 0),
      child: Row(
        children: [
          Text(_getText(0, langageChoice), style: ThemesTextStyles.themes[1][themeChoice],),
          SizedBox(width: 18,),
          ...List.generate(numberMaxSeries, (index) =>
              BlocBuilder<CounterSeriesBloc, CounterSeriesState>(
                builder: (context, state) {
                  counter = state.counter;
                  _isMaxSeriesDone(context, counter, numberMaxSeries);
                  return CounterDotWidgetPlaytimeWorkout(isDone: index < counter);
                },
              )),
        ],
      ),
    );
  }
  void _isMaxSeriesDone(BuildContext context,int counter, int numberMaxSeries) {
    if (counter > numberMaxSeries) {
      // Do something when the maximum number of series is reached
      context.read<CounterSeriesBloc>().add(CounterSerieReset());
    }
  }
  String _getText(int index, int langageChoice) {
    return SourceLangage.titleProgrammLangage[index][langageChoice];
  }
}
