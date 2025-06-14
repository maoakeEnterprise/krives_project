
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/complete_series.dart';
import 'package:krives_project/core/data/datasrouces/data_class/exercise.dart';
import 'package:krives_project/core/data/datasrouces/data_class/muscle.dart';
import 'package:krives_project/core/data/datasrouces/data_class/program.dart';
import 'package:krives_project/features/programme/program_user/bloc/program_bloc/program_bloc.dart';
import 'package:krives_project/features/programme/s_global_bloc/series/series_bloc.dart';

class ServicesProgram {

  static void validateProgram(BuildContext context,TextEditingController name,Program program,String nameFolder){
    context.read<SeriesBloc>().add(ChangeNameProgram(name: name, program: program));
    context.read<ProgramBloc>().add(ProgramInitial(nameFolder: nameFolder));
  }

  static Exercise getTheRightExercise(List<Exercise> exercise, String idExercise){
    Exercise theExercise;
    theExercise = exercise.firstWhere((element) => element.id == idExercise);
    return theExercise;
  }

  static List<Muscle> muscleToShow(List<Muscle> muscles,int numberToShow){
    return muscles.length > numberToShow ? muscles.take(4).toList() : muscles;
  }

  static int addValidateSeries(int actualNumberSerie,int numberMaxSerie){
    if(actualNumberSerie < numberMaxSerie){
      actualNumberSerie = actualNumberSerie + 1;
    }
    return actualNumberSerie;
  }
  static List<CompleteSeries> isEjectTheSerieInTheList(List<CompleteSeries> listCompleteSeries, int actualNumberSerie){
    if(listCompleteSeries[0].series.numberSeries == actualNumberSerie+1){
      listCompleteSeries.removeAt(0);
      return listCompleteSeries;
    }
    else{
      return listCompleteSeries;
    }
  }
}