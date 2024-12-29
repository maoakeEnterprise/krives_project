part of 'main_muscle_bloc.dart';

@immutable
sealed class MainMuscleEvent {}

class MainMuscleSelect extends MainMuscleEvent {
  final int index;
  MainMuscleSelect({required this.index});
}
class MainMuscleInit extends MainMuscleEvent {}
