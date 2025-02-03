part of 'sort_by_bloc.dart';

@immutable
sealed class SortByEvent {}

final class SortByEventPressed extends SortByEvent {
  final int index;
  SortByEventPressed(this.index);
}

final class SortByEventInitial extends SortByEvent {}
