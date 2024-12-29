part of 'edit_bloc.dart';

@immutable
sealed class EditEvent {}

final class EditEventPressed extends EditEvent {}
