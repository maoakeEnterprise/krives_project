part of 'filter_bloc.dart';

@immutable
sealed class FilterEvent {}

class FilterMuscle extends FilterEvent {}
class FilterTimer extends FilterEvent {}
