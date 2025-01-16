part of 'sort_by_bloc.dart';

@immutable
sealed class SortByState {}

final class SortByInitial extends SortByState {}

final class SortByStateSuccess extends SortByState {
  final int index;
  SortByStateSuccess(this.index);
}
