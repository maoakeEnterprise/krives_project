part of 'exercise_bloc.dart';

@immutable
sealed class ExerciseEvent {}

class NewExercise extends ExerciseEvent {}
class ExerciseItemSelected extends ExerciseEvent {
  final Exercise exercise;
  ExerciseItemSelected({required this.exercise});
}
class ModifyItemPressed extends ExerciseEvent {
  final Exercise exercise;
  final bool isNewExercise;
  ModifyItemPressed({required this.exercise, required this.isNewExercise});
}
