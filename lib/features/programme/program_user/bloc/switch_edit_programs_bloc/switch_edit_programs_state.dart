part of 'switch_edit_programs_bloc.dart';

@immutable
sealed class SwitchEditProgramsState {}

final class SwitchEditProgramsInitial extends SwitchEditProgramsState {}
final class ProgramsEditOn extends SwitchEditProgramsState {}
final class ProgramsEditOff extends SwitchEditProgramsState {}
