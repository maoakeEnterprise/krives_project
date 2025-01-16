import 'package:krives_project/core/data/datasrouces/data_class/exercice.dart';

class Exercises {
  List<Exercice> listExercise = [];

  Exercises(this.listExercise);

  Exercises copyWith({List<Exercice>? listExercise}) => Exercises(listExercise ?? this.listExercise);

  void addExercise(Exercice exercice) => listExercise.add(exercice);
  void removeExerciseByExercice(Exercice exercice) => listExercise.remove(exercice);
  void removeExerciseById(int index) => listExercise.remove(listExercise[index]);
  void modifyExercice(Exercice exercice, int index) => listExercise[index] = exercice;
  void replaceListExercice(List<Exercice> listExercice) => listExercise = listExercice;
}