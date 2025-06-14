part of 'playtime_series_bloc.dart';

@immutable
sealed class PlaytimeSeriesEvent {}

final class InitWorkout extends PlaytimeSeriesEvent{
  final Program program;
  InitWorkout({required this.program});
}
final class EndSerie extends PlaytimeSeriesEvent{
  final Program program;
  final List<CompleteSeries> completeSeries;
  final int tmpNbSeries;
  EndSerie({required this.completeSeries, required this.tmpNbSeries,required this.program});
}
