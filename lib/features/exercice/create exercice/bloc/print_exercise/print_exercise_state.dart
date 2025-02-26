part of 'print_exercise_bloc.dart';

@immutable
sealed class PrintExerciseState {
  final Exercise exercise;
  final bool isNewExercise;
  final bool isTransfering;

  const PrintExerciseState({required this.exercise, required this.isNewExercise,required this.isTransfering});
}

final class PrintExerciseInitial extends PrintExerciseState {
  const PrintExerciseInitial({required super.exercise, required super.isNewExercise,required super.isTransfering});
}

final class PrintExerciseLoad extends PrintExerciseState {
  const PrintExerciseLoad({required super.exercise, required super.isNewExercise,required super.isTransfering});
}
