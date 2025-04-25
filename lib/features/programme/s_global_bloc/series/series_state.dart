part of 'series_bloc.dart';

@immutable
abstract class SeriesState {}

class SeriesLoading extends SeriesState {}
class SeriesLoaded extends SeriesState {
  final List<Series> series;
  final Program program;
  SeriesLoaded({required this.series,required this.program});
}
class SeriesError extends SeriesState {
  final String message;
  SeriesError({required this.message});
}