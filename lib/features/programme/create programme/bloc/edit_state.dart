part of 'edit_bloc.dart';

@immutable
sealed class EditState {}

final class EditInitial extends EditState {}

final class EditIconNormal extends EditState {}
final class EditIconReturn extends EditState {}
