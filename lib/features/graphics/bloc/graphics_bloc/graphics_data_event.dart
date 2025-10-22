part of 'graphics_data_bloc.dart';

@immutable
sealed class GraphicsDataEvent {}

final class GetGraphicsDataEvent extends GraphicsDataEvent {}
final class GetOneBackTrackExercise extends GraphicsDataEvent {
  final String idExerciseSelected;
  final List<BackTrackingExercice> listBackTracking;
  final List<Exercise> listExercise;

  GetOneBackTrackExercise({required this.idExerciseSelected, required this.listBackTracking, required this.listExercise});
}

