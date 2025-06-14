import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/data_class/exercise.dart';
import 'package:krives_project/core/data/datasrouces/data_class/program.dart';
import 'package:krives_project/core/data/datasrouces/data_class/series.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/data/repositories/card_custom_add.dart';
import 'package:krives_project/features/programme/create%20programme/widget/widget_card_series.dart';
import 'package:krives_project/features/programme/programme%20series/services/service_series.dart';
import 'package:krives_project/features/programme/services/program_function_services.dart';

class ListViewCreateProgram extends StatelessWidget {
  final List<Series> series;
  final List<Exercise> exercises;
  final Program program;

  const ListViewCreateProgram({
    required this.exercises,
    required this.series,
    required this.program,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    int langageChoice = 0;
    //int themeChoice = 0;
    return ListView.builder(
        itemCount: series.length+1,
        itemBuilder: (context,index){
          if(index == series.length){
            return CardCustomAdd(
              onTap: ServiceSeries.createNewSeries(program,context,series),
              height: 110,
              left: 40,
              right: 40,
              labelText: SourceLangage.titleProgrammLangage[4][langageChoice],);
          }
          else{
            return WidgetCardSeries(
              program: program,
              exercise: ProgramFunctionServices.getTheRightExerciseViaId(series[index].idExercice, exercises),
              onTap: ServiceSeries.goUpdateSeries(program,series[index],context),
              serie: series[index],
            );
          }
    });
  }
}
