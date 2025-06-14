part of 'series_bloc.dart';

@immutable
abstract class SeriesState {}

class SeriesLoading extends SeriesState {}
class SeriesLoaded extends SeriesState {
  final List<Series> series;
  final List<Exercise> exercises;
  final Program program;
  SeriesLoaded({required this.series,required this.program,required this.exercises});
}
class SeriesError extends SeriesState {
  final String message;
  SeriesError({required this.message});
}