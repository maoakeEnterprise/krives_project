part of 'playtime_series_bloc.dart';

@immutable
sealed class PlaytimeSeriesState {}

final class PlaytimeSeriesInitial extends PlaytimeSeriesState {}

final class PlaytimeSeriesLoading extends PlaytimeSeriesState {}
final class PlaytimeSeriesLoaded extends PlaytimeSeriesState {
  final Program program;
  final List<CompleteSeries> completeSeries;
  final int tmpNbSeries;
  PlaytimeSeriesLoaded({required this.completeSeries, required this.program, this.tmpNbSeries = 0});
}
final class PlaytimeSeriesError extends PlaytimeSeriesState {
  final String message;
  PlaytimeSeriesError({required this.message});
}

final class PlaytimeSeriesFinish extends PlaytimeSeriesState {}
