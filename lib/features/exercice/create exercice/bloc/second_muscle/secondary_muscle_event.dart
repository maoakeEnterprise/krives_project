part of 'secondary_muscle_bloc.dart';

@immutable
sealed class SecondaryMuscleEvent {}

class SecondaryMuscleEventPressed extends SecondaryMuscleEvent {
  final int index;
  SecondaryMuscleEventPressed({required this.index});
}
