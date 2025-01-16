part of 'exercice_bloc.dart';

@immutable
sealed class ExerciceState {}

final class ExerciceInitial extends ExerciceState {}

final class ExerciceTransfer extends ExerciceState {
  final Exercice exercice;
  final Exercises exercises;
  final int? index;
  ExerciceTransfer({required this.exercice, required this.exercises,this.index});
}

final class ExerciceLoad extends ExerciceState {
  final Exercice exercice;
  final Exercises exercises;
  final int? index;
  ExerciceLoad({required this.exercice, required this.exercises,this.index});
}

final class ExerciceValidate extends ExerciceState {
  final Exercises exercises;
  ExerciceValidate({required this.exercises});
}
