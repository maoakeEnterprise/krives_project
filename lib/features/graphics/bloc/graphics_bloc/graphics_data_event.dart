part of 'graphics_data_bloc.dart';

@immutable
sealed class GraphicsDataEvent {}

final class GetGraphicsDataEvent extends GraphicsDataEvent {}
final class GetOneBackTrackExercise extends GraphicsDataEvent {
  final String idExerciseSelected;
  final List<Exercise> listExercise;

  GetOneBackTrackExercise({required this.idExerciseSelected, required this.listExercise});
}

