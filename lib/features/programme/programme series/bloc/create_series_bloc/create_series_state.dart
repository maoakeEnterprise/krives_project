part of 'create_series_bloc.dart';

@immutable
sealed class CreateSeriesState {}

final class CreateSeriesInitial extends CreateSeriesState {}

final class SeriesLoading extends CreateSeriesState {}

final class CreateSeriesLoaded extends CreateSeriesState {
  final Series series;
  CreateSeriesLoaded({required this.series});
}

final class SeriesError extends CreateSeriesState {
  final String message;
  SeriesError({required this.message});
}