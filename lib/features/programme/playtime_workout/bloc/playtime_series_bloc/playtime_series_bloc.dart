import 'package:bloc/bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/complete_series.dart';
import 'package:krives_project/core/data/datasrouces/data_class/exercise.dart';
import 'package:krives_project/core/data/datasrouces/data_class/program.dart';
import 'package:krives_project/core/data/datasrouces/data_class/series.dart';
import 'package:krives_project/features/exercice/services/exercise_server_services.dart';
import 'package:krives_project/features/programme/playtime_workout/services/playtime_workout_server_service.dart';
import 'package:krives_project/features/programme/services/series_server_services.dart';
import 'package:krives_project/features/programme/services/services_program.dart';
import 'package:meta/meta.dart';

part 'playtime_series_event.dart';
part 'playtime_series_state.dart';

class PlaytimeSeriesBloc extends Bloc<PlaytimeSeriesEvent, PlaytimeSeriesState> {
  PlaytimeSeriesBloc() : super(PlaytimeSeriesLoading()) {
    on<InitWorkout>(_initWorkout);
    on<EndSerie>(_endSerie);
  }

  Future<void> _initWorkout(InitWorkout event, Emitter<PlaytimeSeriesState> emit) async {
    emit(PlaytimeSeriesLoading());
    try{
      List<Exercise> exercises = await ExerciseServerServices.getExercises();
      List<Series> series = await SeriesServerServices.getSeries(event.program.id);

      List<CompleteSeries> listCompleteSeries = CompleteSeries.getListCompleteSeries(series: series, exercises: exercises);
      emit(PlaytimeSeriesLoaded(completeSeries: listCompleteSeries, program: event.program));
    }catch(error){
      emit(PlaytimeSeriesError(message: error.toString()));
    }
  }
  Future<void> _endSerie(EndSerie event, Emitter<PlaytimeSeriesState> emit) async {
    emit(PlaytimeSeriesLoading());
    try{
      List<CompleteSeries> listCompleteSeries;
      int tmp;
      int tmpMaxSerie = event.completeSeries[0].series.numberSeries;
      tmp = ServicesProgram.addValidateSeries(event.tmpNbSeries, event.completeSeries[0].series.numberSeries);
      await PlaytimeWorkoutServerService.addStatSeriesBackTracking(event.completeSeries[0].series);
      listCompleteSeries =  ServicesProgram.isEjectTheSerieInTheList(event.completeSeries, event.tmpNbSeries);
      if(tmp == tmpMaxSerie) {
        tmp = 0;
      }
      if(listCompleteSeries.isNotEmpty){
        emit(PlaytimeSeriesLoaded(completeSeries: listCompleteSeries, program: event.program,tmpNbSeries: tmp));
      }
      else{
        emit(PlaytimeSeriesFinish());
      }
    }catch(error){
      emit(PlaytimeSeriesError(message: error.toString()));
    }
  }
}
