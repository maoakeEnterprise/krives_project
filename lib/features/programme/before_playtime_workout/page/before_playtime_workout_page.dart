import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/services/function_services.dart';
import 'package:krives_project/features/programme/before_playtime_workout/bloc/program_before_work_out_bloc/program_before_work_out_bloc.dart';
import 'package:krives_project/features/programme/before_playtime_workout/services/berfore_playtime_services.dart';
import 'package:krives_project/features/programme/before_playtime_workout/widget/menu_bar_before_playtime_workout.dart';
import 'package:krives_project/features/programme/before_playtime_workout/widget/profile_before_playtime_workout_widget.dart';
import 'package:krives_project/features/programme/before_playtime_workout/widget/widget_scroll_before_playtime_workout.dart';

class BeforePlaytimeWorkoutPage extends StatelessWidget {
  const BeforePlaytimeWorkoutPage({super.key});

  @override
  Widget build(BuildContext context) {

    BeforePlaytimeServices.initDownloadDataToTheProgramBeforeWorkOut(context);

    return BlocConsumer<ProgramBeforeWorkOutBloc, ProgramBeforeWorkOutState>(
      listener: (context, state) {
        // TODO: implement listener
        if(state is ProgramBeforeWorkOutError){
          FunctionServices.showSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        if(state is ProgramBeforeWorkOutLoading){
          return const Center(child: CircularProgressIndicator());
        }
        else if(state is ProgramBeforeWorkOutLoaded){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            ProfileBeforePlaytimeWorkoutWidget(program: BeforePlaytimeServices.getCurrentProgramInTheBeforePlayTimeWorkOut(context),),
            MenuBarBeforePlaytimeWorkout(program: BeforePlaytimeServices.getCurrentProgramInTheBeforePlayTimeWorkOut(context),),
            SizedBox(height: 16,),
            WidgetScrollBeforePlaytimeWorkout(program: BeforePlaytimeServices.getCurrentProgramInTheBeforePlayTimeWorkOut(context),),
            ],
          );
        }
        return const Center(child: Text('Let the true alpha manage your problem'));


      },
    );
  }
}
