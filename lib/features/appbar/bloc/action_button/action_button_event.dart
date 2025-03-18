part of 'action_button_bloc.dart';

@immutable
sealed class ActionButtonEvent {}

class ActionButtonExercicePressed extends ActionButtonEvent {}
class ActionButtonProgramPressed extends ActionButtonEvent {}
class ActionButtonCreatePressed extends ActionButtonEvent {}
class ActionButtonPressed extends ActionButtonEvent {}
class ActionButtonProgramsPageWithFoldersPressed extends ActionButtonEvent {}
