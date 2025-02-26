part of 'print_exercise_bloc.dart';

@immutable
sealed class PrintExerciseEvent {}

class NewExercise extends PrintExerciseEvent {}
class ExerciseItemSelected extends PrintExerciseEvent {
  final Exercise exercise;
  ExerciseItemSelected({required this.exercise});
}
class ModifyItemPressed extends PrintExerciseEvent {
  final Exercise exercise;
  final bool isNewExercise;
  ModifyItemPressed({required this.exercise, required this.isNewExercise});
}
