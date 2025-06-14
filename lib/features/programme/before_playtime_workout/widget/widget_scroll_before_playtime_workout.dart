import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/program.dart';
import 'package:krives_project/core/services/function_services.dart';
import 'package:krives_project/features/programme/before_playtime_workout/widget/card_exercice_before_playtime_workout_widget.dart';
import 'package:krives_project/features/programme/s_global_bloc/series/series_bloc.dart';

class WidgetScrollBeforePlaytimeWorkout extends StatelessWidget {
  final Program program;

  const WidgetScrollBeforePlaytimeWorkout({super.key, required this.program});

  @override
  Widget build(BuildContext context) {

    context.read<SeriesBloc>().add(SeriesInit(program: program));

    return BlocConsumer<SeriesBloc, SeriesState>(
      listener: (context, state) {
        // TODO: implement listener
        state is SeriesError ? FunctionServices.showSnackBar(context, state.message) : null ;
      },
      builder: (context, state) {
        if(state is SeriesLoading){
          return const Center(child: CircularProgressIndicator());
        }
        if(state is SeriesLoaded){
          return Expanded(
              child: ListView.builder(
                itemCount: state.series.length,
                itemBuilder: (context, index) =>
                    CardExerciceBeforePlaytimeWorkoutWidget(series: state.series[index],exerciseList: state.exercises,),
              )
          );
        }
        return const Center(child: Text("Something is wrong"));
      },
    );
  }
}
