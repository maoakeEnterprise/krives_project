import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/programme/playtime_workout/bloc/playtime_series_bloc/playtime_series_bloc.dart';
import 'package:krives_project/features/programme/playtime_workout/widget/commentary_exo_widget_playtime_workout.dart';
import 'package:krives_project/features/programme/playtime_workout/widget/count_series_playtime_workout_widget.dart';
import 'package:krives_project/features/programme/playtime_workout/widget/detail_weight_rep_widget_playtime_workout.dart';
import 'package:krives_project/features/programme/playtime_workout/widget/is_button_finish_or_remove.dart';
import 'package:krives_project/features/programme/playtime_workout/widget/widget_timer.dart';

class PlaytimeWorkoutPage extends StatefulWidget {
  const PlaytimeWorkoutPage({super.key});

  @override
  State<PlaytimeWorkoutPage> createState() => _PlaytimeWorkoutPageState();
}

class _PlaytimeWorkoutPageState extends State<PlaytimeWorkoutPage> {
  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    return BlocBuilder<PlaytimeSeriesBloc, PlaytimeSeriesState>(
      builder: (context, state) {
        if(state is PlaytimeSeriesLoading){
          return CircularProgressIndicator();
        }
        if(state is PlaytimeSeriesLoaded){

          return state.completeSeries.isNotEmpty ? ListView(
            children: [
              SizedBox(height: 24,),
              Container(
                  margin: EdgeInsets.fromLTRB(13, 0, 0, 0),
                  child: Text(
                    state.completeSeries[0].exercise.name,
                    style: ThemesTextStyles.themes[5][themeChoice],)
              ),
              CountSeriesPlaytimeWorkoutWidget(numberMaxSeries: state.completeSeries[0].series.numberSeries, numberCounter: state.tmpNbSeries+1),
              CommentaryExoWidgetPlaytimeWorkout(),
              DetailWeightRepWidgetPlaytimeWorkout(
                maxCharge: state.completeSeries[0].series.maxKG,
                maxRep: state.completeSeries[0].series.numberRep,
              ),
              IsButtonFinishOrRemove(tmpNbSeries: state.tmpNbSeries, completeSeries: state.completeSeries, program: state.program),
              WidgetTimer(tmpNbSeries: state.tmpNbSeries, completeSeries: state.completeSeries, program: state.program),
            ],
          ) : Container();
        }
        if(state is PlaytimeSeriesFinish){
          Navigator.pop(context);
        }
        return Container();

      },
    );
  }


}
