
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:krives_project/core/data/datasrouces/data_class/exercise.dart';
import 'package:krives_project/core/data/datasrouces/data_class/program.dart';
import 'package:krives_project/core/data/datasrouces/data_class/series.dart';
import 'package:krives_project/features/exercice/services/exercise_server_services.dart';
import 'package:krives_project/features/programme/services/program_function_services.dart';
import 'package:krives_project/features/programme/services/program_server_services.dart';
import 'package:krives_project/features/programme/services/series_server_services.dart';

part 'series_event.dart';
part 'series_state.dart';

class SeriesBloc extends Bloc<SeriesEvent, SeriesState> {

  SeriesBloc() : super(SeriesLoading()) {
    on<SeriesInit>(_seriesInit);
    on<ChangeInTheSeries>(_changeInTheSeries);
    on<LoadTheSeries>(_loadTheSeries);
    on<DeleteSeries>(_deleteSeries);
    on<ChangeNameProgram>(_changeNameProgram);

  }


  Future<void> _seriesInit(SeriesInit event, Emitter<SeriesState> emit) async {
    try{
      List<Series> series = await SeriesServerServices.getSeries(event.program.id);
      List<Exercise> exercises = await ExerciseServerServices.getExercises();
      emit(SeriesLoaded(series: series,program: event.program,exercises: exercises));
    }catch(error){
      emit(SeriesError(message: "Something is wrong when we try to get the series : $error"));
    }
  }

  Future<void> _changeInTheSeries(ChangeInTheSeries event, Emitter<SeriesState> emit) async {
    try{
      emit(SeriesLoading());
      List<Series> series = await SeriesServerServices.getSeries(event.idProgram);
      Program program = await ProgramServerServices.getOnlyOneProgram(event.idProgram);
      List<Exercise> exercises = await ExerciseServerServices.getExercises();
      emit(SeriesLoaded(series: series,program: program,exercises: exercises));
    }catch(error){
      emit(SeriesError(message: "Something is wrong when we try to get the series : $error"));
    }
  }

  Future<void> _deleteSeries(DeleteSeries event, Emitter<SeriesState> emit) async {
    try{
      SeriesServerServices.deleteSeries(event.series);
      List<Series> series = await SeriesServerServices.getSeries(event.program.id);
      List<Exercise> exercises = await ExerciseServerServices.getExercises();
      emit(SeriesLoaded(series: series,program: event.program,exercises: exercises));
    }catch(error){
      emit(SeriesError(message: "Something is wrong when we try to delete the series : $error"));
    }
  }

  Future<void> _loadTheSeries(LoadTheSeries event, Emitter<SeriesState> emit) async {

  }

  Future<void> _changeNameProgram(ChangeNameProgram event, Emitter<SeriesState> emit) async {
    try{
      emit(SeriesLoading());
      Program program = event.program;
      program = ProgramFunctionServices.changeNameProgram(event.name, program);
      await ProgramServerServices.updateProgram(program);
      List<Series> series = await SeriesServerServices.getSeries(program.id);
      List<Exercise> exercises = await ExerciseServerServices.getExercises();
      emit(SeriesLoaded(series: series,program: program,exercises: exercises));
    }catch(error){
      emit(SeriesError(message: "Something is wrong when we try to change the name of the program : $error"));
    }
  }
}
