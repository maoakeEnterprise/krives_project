part of 'exercice_bloc.dart';

@immutable
sealed class ExerciceEvent {}

class ExerciceModifyItemPressed extends ExerciceEvent {
  final Exercice exercice;
  final Exercises exercises;
  final Muscle? muscle;
  final String? commentary;
  final String? name;
  final int? index;
  final bool listMuscle;
  ExerciceModifyItemPressed({
    required this.exercice,
    required this.exercises,
    this.muscle,
    this.commentary,
    this.name,
    this.index,
    this.listMuscle = false
  });
}

class ExerciceNewItem extends ExerciceEvent {
  final Exercice exercice = Exercice("",muscleData[0],[],"");
  final Exercises exercises;
  ExerciceNewItem(this.exercises);
}

class ExerciceItemSelected extends ExerciceEvent {
  final Exercice exercice;
  final Exercises exercises;
  final int? index;
  ExerciceItemSelected({required this.exercice, required this.exercises,this.index});
}

class ConfirmExercice extends ExerciceEvent {
  final String nameExercice;
  final String commentaryExercice;
  final Exercice exercice;
  final Exercises exercises;
  final int? index;
  ConfirmExercice({
    required this.exercice,
    required this.exercises,
    this.index,
    this.nameExercice ="",
    this.commentaryExercice=""
  });
}

class SuppressExercice extends ExerciceEvent {
  final int index;
  final Exercises exercises;
  SuppressExercice({required this.index, required this.exercises});
}