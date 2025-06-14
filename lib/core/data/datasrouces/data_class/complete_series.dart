
import 'package:krives_project/core/data/datasrouces/data_class/exercise.dart';
import 'package:krives_project/core/data/datasrouces/data_class/series.dart';

class CompleteSeries {
  Series series;
  Exercise exercise;
  CompleteSeries({required this.series, required this.exercise});

  static CompleteSeries initCompleteSeries({required Series series, required Exercise exercise}){
    return CompleteSeries(series: series, exercise: exercise);
  }
  
  static List<CompleteSeries> getListCompleteSeries({required List<Series> series, required List<Exercise> exercises}){
    CompleteSeries tmp;
    List<CompleteSeries> completeSeries = [];
    
    for(Series serie in series){
      tmp = CompleteSeries.initCompleteSeries(series: serie, exercise: exercises.firstWhere((element) => element.id == serie.idExercice));
      completeSeries.add(tmp);
    }
    
    return completeSeries;
  }
}