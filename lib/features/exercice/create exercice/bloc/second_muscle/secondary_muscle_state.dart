part of 'secondary_muscle_bloc.dart';

@immutable
sealed class SecondaryMuscleState {}

final class SecondaryMuscleInitial extends SecondaryMuscleState {}

final class SecondaryMuscleSelected extends SecondaryMuscleState {
   List<int> selectedMuscles = [];
   SecondaryMuscleSelected();
}
