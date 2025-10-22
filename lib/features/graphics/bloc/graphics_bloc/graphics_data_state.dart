part of 'graphics_data_bloc.dart';

@immutable
sealed class GraphicsDataState {}

final class GraphicsDataInitial extends GraphicsDataState {}

final class GraphicsDataLoaded extends GraphicsDataState {
  final String idExerciseSelected;
  final List<Exercise> listExercise;
  final List<BackTrackingExercice> listBackTracking;

  GraphicsDataLoaded({required this.idExerciseSelected,required this.listExercise, required this.listBackTracking});
}

final class GraphicsDataError extends GraphicsDataState {
  final String errorMessages;

  GraphicsDataError({required this.errorMessages});
}

final class GraphicsDataLoading extends GraphicsDataState {}


