part of 'exercise_bloc.dart';

@immutable
sealed class ExerciseState {
  final Exercise exercise;
  final bool isNewExercise;
  final bool isTransfering;

  const ExerciseState({required this.exercise, required this.isNewExercise,required this.isTransfering});
}

final class PrintExerciseInitial extends ExerciseState {
  const PrintExerciseInitial({required super.exercise, required super.isNewExercise,required super.isTransfering});
}

final class PrintExerciseLoad extends ExerciseState {
  const PrintExerciseLoad({required super.exercise, required super.isNewExercise,required super.isTransfering});
}
