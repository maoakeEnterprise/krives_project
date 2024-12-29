part of 'main_muscle_bloc.dart';

@immutable
sealed class MainMuscleState {}

final class MainMuscleInitial extends MainMuscleState {}

final class MainMuscleSelected extends MainMuscleState {
  final int index;
  MainMuscleSelected({required this.index});
}
