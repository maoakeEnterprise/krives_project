part of 'exercise_serv_bloc.dart';

@immutable
sealed class ExerciseServEvent {}

class AddExercise extends ExerciseServEvent {
  final Exercise exercise;
  AddExercise({required this.exercise});
}
class ModifyExercise extends ExerciseServEvent {
  final Exercise exercise;
  ModifyExercise({required this.exercise});
}
class DeleteExercise extends ExerciseServEvent {
  final Exercise exercise;
  DeleteExercise({required this.exercise});
}
class LoadExercises extends ExerciseServEvent {}
