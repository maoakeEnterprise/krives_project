part of 'exercise_serv_bloc.dart';

@immutable
sealed class ExerciseServState {}

final class ExerciseServInitial extends ExerciseServState {}

final class ExerciseLoading extends ExerciseServState {}
final class ExerciseLoaded extends ExerciseServState {
  final List<Exercise> exercises;
  ExerciseLoaded({required this.exercises});
}
final class ExerciseError extends ExerciseServState {
  final String message;
  ExerciseError({required this.message});
}
