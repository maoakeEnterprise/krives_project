part of 'action_button_bloc.dart';

@immutable
sealed class ActionButtonState {}

final class ActionButtonInitial extends ActionButtonState {}

final class ActionButtonEdit extends ActionButtonState {}
final class ActionButtonEditProgram extends ActionButtonState {}
final class ActionButtonValidate extends ActionButtonState {}
final class ActionButtonDelete extends ActionButtonState {}
